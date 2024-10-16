Return-Path: <linux-rtc+bounces-2208-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B28CE9A013C
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 08:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 359B71F2560A
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 06:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D8518C002;
	Wed, 16 Oct 2024 06:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ql3/3EKL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8421E60B8A;
	Wed, 16 Oct 2024 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729059512; cv=none; b=fk/o6nc+jnP9lzmrma73N2YZwTdTQy+mzLq0Sjn9N+bBshbV3RHxXAIqm2T1CI5/rsm+VLorMcLjlgf3YItv1m9eJve092KBIreE/Nijb9rzj4b/NgGe2r0Kj+p9LFrMGaxYYMeQOkA3kb0wutscR4FP3+Z5iqnbKFHrhXMeT4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729059512; c=relaxed/simple;
	bh=bSxrVPFY6MismMybOJ6RhJCmurNcqH/DWP1dgigiEHI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=m04gKTYk9iXYkefYF/yioKHJmzC0aa4s8XHRmvSVrJVT2QBo0wgxeqVTSXATS+PvlSLWNT5J+XyIIW63ax6RVpSTBfyz7Yo2DEP9ExQ7gO9UH1phKFCMeoBIuNW6LPsVA8g+aG7unfw/DX6aFwp1GhGi5WG1CE0dOBhGwOay4EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ql3/3EKL; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:
	Content-Type; bh=Mu1GgstFkcfNzb/x965Hebrdlwn3qU7b65xoHduhzVo=;
	b=Ql3/3EKL68tVJDKiB75nrdeyT0L3hmgZMnoVnyMH/qQ4oUG0jEBxhdsLR4jNWt
	fNRfr4SBcDLn8ruBiAS1cBHyHe5y/xuEWylfsM7mBij6Bj+nh2dYK0jp8m+Vq4eC
	fd+g8PHScYbliG8x4f/0i3IBlmp6jCeMmjgigQmCaMb+Y=
Received: from [10.42.116.195] (unknown [111.48.58.10])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_yebWg9noEm+BQ--.2090S2;
	Wed, 16 Oct 2024 14:18:05 +0800 (CST)
Message-ID: <1a7545e2-23b3-cba3-6b11-fb8a19f91773@163.com>
Date: Wed, 16 Oct 2024 14:18:03 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 huanglei <huanglei@kylinos.cn>
From: huanglei <huanglei814@163.com>
Subject: HTML message rejected: Re: [PATCH] rtc: add prefix modalias for rtc
 modules
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_yebWg9noEm+BQ--.2090S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1xJw15KryfuF4fCry8Krg_yoW5Aw48pr
	W5GF1furyUKr1Iqa1xXw1YvF4Y9w13Kw4UJF1rJ3sIv3Z3Z3ZrArn7tFW5ZFy7Xrn3Xa1a
	gws8Ar15CF95Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0YL9UUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbi7hp69mcPTcHBPwACsg

Thank you for your reply.

However, Most other drivers have already set MODULE_ALIAS,  such as 
rtc-efi.c have set MODULE_ALIAS("platform:rtc-efi");

So I think this is necessary. If loaded automatically is required, 
sometimes it is necessary to match through this alias.

MODULE_ALIAS adds some more info for the userspace programs. In 
/lib/modules/VERSION/modules.alias you can see the aliases that were 
parsed from the modules.

In this case running  'modprobe spi:rtc-ds1302' would insert the ds1302 
module.

Now , you can see the difference between applying this patch and not 
applying it.

This is not applying this patch,  part of  the modules.alias related to 
rtc_ds1302/ds1347 rtc：

alias platform:rtc-ds1286 rtc_ds1286
alias spi:rtc-ds1305 rtc_ds1305
alias spi:rtc-ds1390 rtc_ds1390
alias platform:ds1511 rtc_ds1511
alias platform:rtc-ds1553 rtc_ds1553
alias platform:rtc-ds1685 rtc_ds1685
alias platform:rtc-ds1742 rtc_ds1742
alias platform:ds2404 rtc_ds2404
alias platform:rtc-efi rtc_efi

And this is applying this patch,  part of  the modules.alias related to 
rtc_ds1302/ds1347 rtc：

alias platform:rtc-ds1286 rtc_ds1286
alias spi:rtc-ds1302 rtc_ds1302
alias spi:rtc-ds1305 rtc_ds1305
alias spi:ds1347 rtc_ds1347
alias spi:rtc-ds1390 rtc_ds1390
alias platform:ds1511 rtc_ds1511
alias platform:rtc-ds1553 rtc_ds1553
alias platform:rtc-ds1685 rtc_ds1685
alias platform:rtc-ds1742 rtc_ds1742
alias platform:ds2404 rtc_ds2404
alias platform:rtc-efi rtc_efi

So, if not applying this patch,  use modprobe rtc-ds1302/ds1347 may be 
not  to load automatically.

Therefore, it is strongly recommended applying this patch.

Best regards,


在 2024/10/15 15:52, Krzysztof Kozlowski 写道:
 > On 15/10/2024 04:43, huanglei814 wrote:
 >> From: huanglei <huanglei@kylinos.cn>
 >>
 >> When these rtc drivers is built as a module, To wire it up to udev,
 >> and let the module be loaded automatically, we need to export these
 >> alias from the modules.
 >>
 >> Signed-off-by: huanglei <huanglei@kylinos.cn>
 >> ---
 >>  drivers/rtc/rtc-ds1302.c | 1 +
 >>  drivers/rtc/rtc-ds1307.c | 1 +
 >>  drivers/rtc/rtc-ds1343.c | 1 +
 >>  drivers/rtc/rtc-ds1347.c | 1 +
 >>  drivers/rtc/rtc-ds1374.c | 1 +
 >>  drivers/rtc/rtc-ds1672.c | 1 +
 >>  6 files changed, 6 insertions(+)
 >>
 >> diff --git a/drivers/rtc/rtc-ds1302.c b/drivers/rtc/rtc-ds1302.c
 >> index ecc7d0307932..cc82f8e6326b 100644
 >> --- a/drivers/rtc/rtc-ds1302.c
 >> +++ b/drivers/rtc/rtc-ds1302.c
 >> @@ -211,3 +211,4 @@ module_spi_driver(ds1302_driver);
 >>  MODULE_DESCRIPTION("Dallas DS1302 RTC driver");
 >>  MODULE_AUTHOR("Paul Mundt, David McCullough");
 >>  MODULE_LICENSE("GPL v2");
 >> +MODULE_ALIAS("spi:rtc-ds1302");
 >
 > NAK. That's neither correct, nor necessary. Driver has proper tables and
 > is loaded automatically in correct setup. I assume your setup is just
 > incorrect, but without description tricky to say how.
 >
 > Best regards,
 > Krzysztof


