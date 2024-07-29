import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/features/setup_locations/domain/entity/file_entity.dart';
import 'package:reception_application/features/setup_locations/presentation/bloc/select_media/select_media_bloc.dart';

import '../../../../../base/base_widget.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../../domain/entity/media_entity.dart';

class SelectMediaWidget extends StatefulWidget {
  const SelectMediaWidget(
      {super.key, this.media, required this.onSelectedMedia});
  final FileEntity? media;
  final Function(FileEntity fileEntity) onSelectedMedia;

  @override
  State<SelectMediaWidget> createState() => _SelectMediaWidgetState();
}

class _SelectMediaWidgetState extends BaseState<SelectMediaWidget,
    SelectMediaEvent, SelectMediaState, SelectMediaBloc> {
  FileEntity? selectedMedia;

  @override
  void initState() {
    super.initState();
    bloc.add(const SelectMediaEvent.initData());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(LocaleKeys.select_audio_video.tr(), style: AppStyles.s20w500),
          const SizedBox(height: 20),
          blocBuilder((context, state) {
            return SizedBox(
              height: 1.sh * 2 / 3 - 100.h,
              child: GridView(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: 1,
                ),
                children: state.files?.map((e) => _buildItem(e)).toList() ?? [],
              ),
            );
          }),
          SizedBox(height: 20.h),
          CustomTextButton(
              title: LocaleKeys.ok.tr(),
              isDisable: selectedMedia == null,
              textStyle: AppStyles.s13w500.copyWith(color: Colors.white),
              verticalPadding: 2.h,
              borderRadius: 8,
              onPressed: () async {
                final Directory tempDir = await getTemporaryDirectory();
                final String tempPath = tempDir.path;
                final String fileName = selectedMedia?.name ??
                    DateTime.now().millisecondsSinceEpoch.toString();
                final File file = File('$tempPath/$fileName');
                bool isDownloaded = await file.exists();
                String baseURL = dotenv.get('AUDIO_URL');
                if (!isDownloaded) {
                  DialogService.showDownloading(context);
                  isDownloaded = await downloadFile(
                      "$baseURL/api/v1/get/file/${selectedMedia?.fileId}",
                      file.path);
                  DialogService.hideDownloading(context);
                }
                if (isDownloaded) {
                  selectedMedia?.localFilePath = file.path;
                }
                widget.onSelectedMedia(selectedMedia!);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  Widget _buildItem(FileEntity media) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMedia = media;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: selectedMedia?.fileId == media.fileId
              ? AppColors.alertLink.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Assets.svg.icAudioFile.svg(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.h),
            Text(media.name ?? '', style: AppStyles.s14w500),
          ],
        ),
      ),
    );
  }

  Future<bool> downloadFile(String url, String fileName) async {
    final File file = File(fileName);
    if (await file.exists()) {
      return true;
    } else {
      final Dio dio = Dio();
      try {
        await dio.download(url, file.path);
        return true;
      } catch (e) {
        return false;
      }
    }
  }
}
