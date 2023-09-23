Return-Path: <linux-rtc+bounces-14-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E594D7AC407
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Sep 2023 19:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 5F25A1C203AE
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Sep 2023 17:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED6920B2F;
	Sat, 23 Sep 2023 17:37:01 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA2D1640F
	for <linux-rtc@vger.kernel.org>; Sat, 23 Sep 2023 17:37:00 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8431519C;
	Sat, 23 Sep 2023 10:36:58 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c39f2b4f5aso29766245ad.0;
        Sat, 23 Sep 2023 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695490618; x=1696095418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlE6JLRfL48qtVwq8jA/2h0BZ48NcfrSjI1lDQ5avkE=;
        b=UUDKUWN6eT64lnmOU3admofshJbH0x33cyjAFmu3qr4uF528zwtB7P2xPv+L5jqa2S
         SKiBgdIAmZWaHRbJbAzMDI/f+hC10EdF2q1wqM1OZ20OVJuy3AnFuYxwa16Dt5EiEps5
         EoNpOmgTQW+g3DmAGo9domgb1o+dPiJvKpV4HwWb6gZp3x/grizgbLLaCWjlcpQVGag/
         06jfntnoHsJPjZjXKflw/8Y22YEbJJfOd9TT7N3JiLFgvyCZg9YH5NzBlneO2us9aPEk
         6RpzU+UvOqBqpR0ESO8dtZ9hzPMUdxMYSAjRNQxbtiD6ffjXA7TuvqvQDVFuKiaqnmf5
         Iszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490618; x=1696095418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlE6JLRfL48qtVwq8jA/2h0BZ48NcfrSjI1lDQ5avkE=;
        b=C6FX4aDJ0uFzgA0DklRZZdIgongw8Hsl7mo/v1GY1xjh4rw2OMlosK2GcZCkL1XtQj
         rNkMdP6D25vFggQOAewrrutORjSMgeS0clhroFNxpfsp1vKknhzZMN7hFCbgKiYJndDn
         GPq2+fFOYMxOm3LvX6SrM0YFIb565DMe366NPofyhcDpMr7Ck6fkohphhHKFwQEOPhku
         ny5MfkiW1XYQmrDP/ebiHeZ0R/FAxit5mrxGkmO+VB3U+QratOys4KjOVeQNCMJhvtAR
         cfelCZwqme/2AQcmtCVH1oKR+eNySwgiIDTNEv6Yg4ZGL+lBLYNYseVyegUD6o97nulu
         mhlA==
X-Gm-Message-State: AOJu0YwmRirPCIDPgoDRr7iHVSVmUOnlaeIGoNMS0KY+WMtx+ij+UBeO
	gfCBhbNJg7KqFwub+H26WxIL/fAYa2U=
X-Google-Smtp-Source: AGHT+IFSlAyqGeRovEjDNA4A/S+3zh83GX0PrVo3gnROIu0Q0EjRgGRrlmfg0p7A9iVAdg6YXQtFCQ==
X-Received: by 2002:a17:902:e84d:b0:1c4:50fd:7cd1 with SMTP id t13-20020a170902e84d00b001c450fd7cd1mr2130303plg.11.1695490617930;
        Sat, 23 Sep 2023 10:36:57 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:3075:4405:fdad:b3f9])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902e54500b001b8b2b95068sm5585448plf.204.2023.09.23.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 10:36:57 -0700 (PDT)
Date: Sat, 23 Sep 2023 23:06:52 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] selftests: rtc: Fixes rtctest error handling.
Message-ID: <20230923173652.GC159038@atom0118>
References: <20230817091401.72674-1-atulpant.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817091401.72674-1-atulpant.linux@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Aug 17, 2023 at 02:44:01PM +0530, Atul Kumar Pant wrote:
> Adds a check to verify if the rtc device file is valid or not
> and prints a useful error message if the file is not accessible.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
> 
> changes since v5:
>     Updated error message to use strerror().
> 	If the rtc file is invalid, the skip the test.
> 
> changes since v4:
>     Updated the commit message.
> 
> changes since v3:
>     Added Linux-kselftest and Linux-kernel mailing lists.
> 
> changes since v2:
>     Changed error message when rtc file does not exist.
> 
> changes since v1:
>     Removed check for uid=0
>     If rtc file is invalid, then exit the test.
> 
>  tools/testing/selftests/rtc/rtctest.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> index 630fef735c7e..27b466111885 100644
> --- a/tools/testing/selftests/rtc/rtctest.c
> +++ b/tools/testing/selftests/rtc/rtctest.c
> @@ -15,6 +15,7 @@
>  #include <sys/types.h>
>  #include <time.h>
>  #include <unistd.h>
> +#include <error.h>
>  
>  #include "../kselftest_harness.h"
>  #include "../kselftest.h"
> @@ -437,7 +438,7 @@ int main(int argc, char **argv)
>  	if (access(rtc_file, F_OK) == 0)
>  		ret = test_harness_run(argc, argv);
>  	else
> -		ksft_exit_fail_msg("[ERROR]: Cannot access rtc file %s - Exiting\n", rtc_file);
> +		ksft_exit_skip("%s: %s\n", rtc_file, strerror(errno));
>  
>  	return ret;
>  }
> -- 
> 2.25.1
> 

	Hi Shuah, I have made the changes as per your comments. Can you please
	review the changes ?

