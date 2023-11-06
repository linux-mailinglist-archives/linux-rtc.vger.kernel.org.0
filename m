Return-Path: <linux-rtc+bounces-216-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C327E298E
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Nov 2023 17:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33DB91C20AFF
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Nov 2023 16:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6F628E3F;
	Mon,  6 Nov 2023 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VtQ2pRc9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1CC21342
	for <linux-rtc@vger.kernel.org>; Mon,  6 Nov 2023 16:17:13 +0000 (UTC)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90BCD45
	for <linux-rtc@vger.kernel.org>; Mon,  6 Nov 2023 08:17:11 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7ba0d338367so2004079241.2
        for <linux-rtc@vger.kernel.org>; Mon, 06 Nov 2023 08:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699287431; x=1699892231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYrrVMbxc0VRl0T51sQL5ouQRKzVXCSKTbYsaRlfNlk=;
        b=VtQ2pRc9qkkwnGp61Kg4sTF477QJWI2V+AzBR4HGGzifA9fiTkfJTudzMUwKLWPwWF
         74Mqno8HF0gwP6/NyoCLQNPxs2mx3VVcLbWSUFQhwdGBRuj02AzneXBhpgM4XGGZDDMY
         6ee13vWGsV8MyYrQZyAdoHIEIz9y7okzFsGsSOd7cjMOVuVrrmobaeRJZgP2yzfmk9jn
         wzYZSjo1eZjuBbzjz68b6zTs9R9/+hV7AdVb0wFKw9CIoHip/W4ShTg2fZjQVxxl9G7E
         83a1rjxpuBMdWRUrbMfNPJIAJwSP6iPlfThbKJe7HlNnyvgL84syqgYbjXeDBH9aN78P
         UKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287431; x=1699892231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYrrVMbxc0VRl0T51sQL5ouQRKzVXCSKTbYsaRlfNlk=;
        b=p0gsSF/4UAEyhk5VejLWflW3XAnEMoRhDRTnIC31xu3/MgunlcDwddIgFCjJNiTTvG
         S4jDaYrJB2nicdczb7zISCrQ2qsyyovJAJC+CGeH0SQyM/Fm0zhc952y3/fa4d1/VAbp
         wICaioj3R9xWJdNqzl48LXEC3Nn19kswoboSdKOUEvJSsgwseKypOrndvzLhvzuElEAB
         xGlDmCfS2ZMXnxQzXoY7G8Rp0DzQNau5RZn1qDTLCB8IAL1RhGTHGXNqN6mmmfXVP0tu
         CbioZjRQ6PIv0Y1i7pOF4WeXp1Y+aKAwIv8IFnMhQGIADTX36ct3WR7GtJbka2DJcj9y
         VYfg==
X-Gm-Message-State: AOJu0Yyw9qyEy/v7LS+W4BWpMREtY0nJfQAQDT05njeYxKSaEMegSLyz
	X9EyW7BjMch3m2Sss2ROs9mavZsG9XQ8GsvyEEoF/w==
X-Google-Smtp-Source: AGHT+IFKRHhGeayrcltrTH556Eh/wQ5NKx4PCQ4wk+vJDgH/5qrxyMWbaO+rqL9VaJ/IXq+99r8jAFRWwAeQrY8H4U4=
X-Received: by 2002:a67:e0c5:0:b0:45d:b6af:99ae with SMTP id
 m5-20020a67e0c5000000b0045db6af99aemr3856813vsl.35.1699287430954; Mon, 06 Nov
 2023 08:17:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106162310.85711-1-mario.limonciello@amd.com>
In-Reply-To: <20231106162310.85711-1-mario.limonciello@amd.com>
From: Raul Rangel <rrangel@google.com>
Date: Mon, 6 Nov 2023 09:17:00 -0700
Message-ID: <CAHQZ30DP8ED4g3bib-tZ53rm2q2_ouEEL3TxD-SgK4YrCe3bew@mail.gmail.com>
Subject: Re: [PATCH] rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	alvin.zhuge@gmail.com, renzhamin@gmail.com, kelvie@kelvie.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 9:14=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Intel systems > 2015 have been configured to use ACPI alarm instead
> of HPET to avoid s2idle issues.
>
> Having HPET programmed for wakeup causes problems on AMD systems with
> s2idle as well.
>
> One particular case is that the systemd "SuspendThenHibernate" feature
> doesn't work properly on the Framework 13" AMD model. Switching to
> using ACPI alarm fixes the issue.
>
> Adjust the quirk to apply to AMD/Hygon systems from 2021 onwards.
> This matches what has been tested and is specifically to avoid potential
> risk to older systems.
>
> Cc: stable@vger.kernel.org # 6.1+
> Reported-by: alvin.zhuge@gmail.com
> Reported-by: renzhamin@gmail.com
> Closes: https://github.com/systemd/systemd/issues/24279
> Reported-by: Kelvie Wong <kelvie@kelvie.ca>
> Closes: https://community.frame.work/t/systemd-suspend-then-hibernate-wak=
es-up-after-5-minutes/39392
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/rtc/rtc-cmos.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
> index 228fb2d11c70..696cfa7025de 100644
> --- a/drivers/rtc/rtc-cmos.c
> +++ b/drivers/rtc/rtc-cmos.c
> @@ -818,18 +818,24 @@ static void rtc_wake_off(struct device *dev)
>  }
>
>  #ifdef CONFIG_X86
> -/* Enable use_acpi_alarm mode for Intel platforms no earlier than 2015 *=
/
>  static void use_acpi_alarm_quirks(void)
>  {
> -       if (boot_cpu_data.x86_vendor !=3D X86_VENDOR_INTEL)
> +       switch (boot_cpu_data.x86_vendor) {
> +       case X86_VENDOR_INTEL:
> +               if (dmi_get_bios_year() < 2015)
> +                       return;
> +               break;
> +       case X86_VENDOR_AMD:
> +       case X86_VENDOR_HYGON:
> +               if (dmi_get_bios_year() < 2021)
> +                       return;
> +               break;
> +       default:
>                 return;
> -
> +       }
>         if (!is_hpet_enabled())
>                 return;
>
> -       if (dmi_get_bios_year() < 2015)
> -               return;
> -
>         use_acpi_alarm =3D true;
>  }
>  #else
> --
> 2.34.1
>
Acked-by: Raul E Rangel <rrangel@chromium.org>

