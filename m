Return-Path: <linux-rtc+bounces-4065-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D83AAF415
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 08:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 057CA3AE49E
	for <lists+linux-rtc@lfdr.de>; Thu,  8 May 2025 06:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB61021CC57;
	Thu,  8 May 2025 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQMEo6hG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B421CA14;
	Thu,  8 May 2025 06:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686925; cv=none; b=RnkLbSN9hUHp2wlHcgYt/DyODK4fT95HIj0tQ7cPx5ixr1R3TZi+sBJ0gtpMQmU3CietPXErNHL31XIdUG1uG7JJwXDBrgx12jV1FDPeDqq0JIWG7XBzBxfAXBVsqFlZsF19LHlpYvht9/RuFnvxsl3yHDoI8HAII4532Aqjf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686925; c=relaxed/simple;
	bh=YMrOzD3VyxiaoPpfqoCDnpxhDzrnythHPKhA1mCv52Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSi2Zi9ZBOv6+Q750b13uwzxx0alF+7yUqoaJ4rvmW1tGmgC6tge5kpSCZrji2mI41S/ibVrc+MHotIhrGEdAiLBLVE6BmEuBfeOQW72etEsWR7JxCBX7xzuVTk2fvembmSHLivWgdHmghNVLXWO6nqwPNizWVQ/714bLQRJj6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQMEo6hG; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3b12e8518so122932666b.0;
        Wed, 07 May 2025 23:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746686922; x=1747291722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao8mC0ekvjVOFywPGMkg1iNykeaz41R3uCCx81z58CE=;
        b=IQMEo6hGo9mP7T2vc3pTYx47zQlSkwFQ6Tq12BA2SpftYRI34vOphkQSmlVp4tPiao
         xI+AcotsM86GzMkqAl6IfC8ZlS/tzL2x58pEIlW5OKkzxzlbODlqzMmCgCeK4EjNWdbt
         ltx0kxqcg1z+Aswd9FqiM0GroT2Ih+/h6NEA2auD4mFH3nzTLDr+C4GAJ4PAFodyp+44
         RFjE53djeJh33EG7+fE0ankB6Gy23EbNdM5YOrRo7kVRcWam49EHC9gBoKYPYqeIcMKY
         gTw1LHXnyEj4tdmm0K18OThAzv8jXtiRmrTPf36k4unTaH2xohweAL6KBagrpy1iWnnr
         OtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686922; x=1747291722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ao8mC0ekvjVOFywPGMkg1iNykeaz41R3uCCx81z58CE=;
        b=wSAPRFhAuCefnUzL4ZPU9JOMSlotJYGVMimUslUi2cuasWT3VxdSl9ZF/X79Cpkhpv
         OI3kyeZpP/LAE5qDqn75yRWqFZzwTFRknodOvPIMTslDvCrbNNEj4I+7PFzJypKRDpAm
         IqTMucGQV1eEIglfbT+SE4z1C6IEkArOGc5bm+7GMJbYJgfQJlDE2vCS9+EURZj4ZKr1
         tZM6BtPj5leOVgndA9hk7UFFUh/Dq7Py1Nh2z8IGje0hDLxvGx173zaZXQrHr2Gk+u/9
         Uq7RsGYntcCLkZmgQ0uIAE3ftvLB24ZmkkvFWUAA/XDv5qK07noldJY4Ph7bd3sVttwA
         CbYA==
X-Forwarded-Encrypted: i=1; AJvYcCVDYvguODmveFCfGAEKjSiM/2V1jRibzjiyW8YWZ1DKrWXMsj0RO22ROeHBPiRy8aXml2G9H3skW53u@vger.kernel.org, AJvYcCWX5PgHX1icHbrzB3lCfcSN/tZyKvJ25lMh75MLVGN86ZwAVM2W4EypYf5GNBPxToBe5CZvxtfDSu0jIvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkWrg0l7XUlVqYe01xmHVmtJwcrEI36YoyuTXBZVFR7OBET8ob
	wcLu9UnswCvBryUuNnDc8qiTLGEKBPqlFzd8ROetXqG5D7GtfgQOCIvA53YvxzyGvS3fTfAXHNX
	jFOvAQpZ7GB+2yqlZP61lZJIeym8=
X-Gm-Gg: ASbGncu9OMPKiFobaFPL7NPM5UhQKzNr0rgoLngeyfMb5g4qti5nEmQw/bAStQnEiXy
	H1QbpVLZyyYxzdGt93ihBNOks6i4iI4wM6oD1JNFJpFE2UUI0Xew8AtbPkYhyIQu3BpHko2L3vg
	zDfNgEvCjJLGDyo2QNVRidolRCCagH/DWQaA==
X-Google-Smtp-Source: AGHT+IGZkbzmd9kVO5qhPqdJ+ayM/ASir2y6ZnQGrwOuPLqKHTltqMdpDNUm3EvvBgGyljIQNkhGk4hR2LAgvesT+JY=
X-Received: by 2002:a17:906:99c4:b0:ad2:a2c:cc1d with SMTP id
 a640c23a62f3a-ad20a2ccebamr42689566b.2.1746686921891; Wed, 07 May 2025
 23:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429062736.982039-1-liudalin@kylinsec.com.cn>
 <2fa3740a-9181-40bf-9b1a-eeb6ffc6f23f@loongson.cn> <58BBF92742F0D0E1+2025050814202393211321@kylinos.com.cn>
In-Reply-To: <58BBF92742F0D0E1+2025050814202393211321@kylinos.com.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 8 May 2025 14:48:27 +0800
X-Gm-Features: ATxdqUFj9CwgwvS0tMOEYz0BHKMvdAHU6JmB6epS3RzSRFOPgayYDkdNO5Ea3bM
Message-ID: <CAMpQs4KN_OBOi8XO0pcXXDEt-D2RrN8NUTVYQBOHRY89gufi=A@mail.gmail.com>
Subject: Re: Re: [PATCH] rtc: loongson: Add missing alarm notifications for
 ACPI RTC events
To: "liudalin@kylinos.com.cn" <liudalin@kylinos.com.cn>
Cc: zhoubinbin <zhoubinbin@loongson.cn>, =?UTF-8?B?5YiY6L6+5p6X?= <liudalin@kylinsec.com.cn>, 
	"alexandre.belloni" <alexandre.belloni@bootlin.com>, wangming01 <wangming01@loongson.cn>, 
	chenhuacai <chenhuacai@kernel.org>, gaojuxin <gaojuxin@loongson.cn>, git <git@xen0n.name>, 
	"jiaxun.yang" <jiaxun.yang@flygoat.com>, "keguang.zhang" <keguang.zhang@gmail.com>, 
	lixuefeng <lixuefeng@loongson.cn>, linux-rtc <linux-rtc@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

On Thu, May 8, 2025 at 2:20=E2=80=AFPM liudalin@kylinos.com.cn
<liudalin@kylinos.com.cn> wrote:
>
> Hi Binbin:
>    The described issue does not happened  with or without the patch by te=
st, as the interrupt is managed by acpi.

I see it.
>
> The device info and test result are as follows.
>
> 1. Device info
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]# dmidecod=
e
> # dmidecode 3.5
> Getting SMBIOS data from sysfs.
> SMBIOS 3.2.0 present.
> Table at 0x90000000FD620000.
>
> Handle 0x0000, DMI type 0, 24 bytes
> BIOS Information
>         Vendor: ZD-TECH
>         Version: V09
>         Release Date: 06/15/2022
>         ROM Size: 8 MB
>         Characteristics:
>                 PCI is supported
>                 BIOS is upgradeable
>                 BIOS shadowing is allowed
>                 Boot from CD is supported
>                 Selectable boot is supported
>                 BIOS ROM is socketed
>                 Serial services are supported (int 14h)
>                 USB legacy is supported
>                 Function key-initiated network boot is supported
>                 UEFI is supported
>         BIOS Revision: 4.0
>         Firmware Revision: 0.4
>
> Handle 0x0001, DMI type 1, 27 bytes
> System Information
>         Manufacturer: GEIT
>         Product Name: UT6000-LB5
>         Version: 1.0
>         Serial Number: TBD by OEM
>         UUID: 00112233-4455-6677-8899-aabbccddeeff
>         Wake-up Type: Power Switch
>         SKU Number: Loongson_SKU
>         Family: Type1Family
>
> Handle 0x0002, DMI type 2, 15 bytes
> Base Board Information
>         Manufacturer: GEIT
>         Product Name: GG-3A5000-02

My machine is also Loongosn-3A5000 + 7A2000, I think this should not affect=
.

>         Version: 1.0
>         Serial Number: Chassis Board Serial#To Be Filled By O.E.M
>         Asset Tag: Type2 - Board Asset Tag
>         Features:
>                 Board is a hosting board
>                 Board is replaceable
>         Location In Chassis: Type2 - Board Chassis Location
>         Chassis Handle: 0xFFFF
>         Type: Motherboard
>         Contained Object Handles: 0
>
> 2. The system exhibits a timeout error when waiting for alarm signal resp=
onse without the patch.
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]# cat /pro=
c/interrupts |grep acpi
>  21:          3          0          0          0   PCH PIC   1  acpi
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]#
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]# ./rtc01
> RTC READ TEST:
> RTC READ TEST Passed
> Current RTC date/time is 8-5-2025, 05:50:05.
> RTC ALARM TEST :Alarm time set to 05:50:10.
> Waiting 5 seconds for the alarm...
> Timed out waiting for the alarm
> RTC UPDATE INTERRUPTS TEST :
> RTC_UIE_ON not supported
> RTC Tests Done!
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]#
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]# cat /pro=
c/interrupts |grep acpi
>  21:          4          0          0          0   PCH PIC   1  acpi
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]#
>
Please try continuous testing to see if you get different results.

Here is my test code, it behaves fine on Loongson-2K1000, you can
compare it with yours.
https://gist.github.com/AaronDot/affafc0b861783aee128a76b34d45f55

Also, your test code can be provided to me for testing.

> 3. There is no error with the patch applied and the interrupts are trigge=
red ok
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]# cat /pro=
c/interrupts |grep acpi
>  21:          0          0          0          0   PCH PIC   1  acpi
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]#
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]# ./rtc01
> RTC READ TEST:
> RTC READ TEST Passed
> Current RTC date/time is 8-5-2025, 06:09:03.
> RTC ALARM TEST :Alarm time set to 06:09:08.
> Waiting 5 seconds for the alarm...
> Alarm rang.
> RTC ALARM TEST Passed
> RTC UPDATE INTERRUPTS TEST :
> RTC_UIE_ON not supported
> RTC Tests Done!
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]#
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]# cat /pro=
c/interrupts |grep acpi
>  21:          1          0          0          0   PCH PIC   1  acpi
> [=E7=B3=BB=E7=BB=9F=E6=9C=AA=E6=BF=80=E6=B4=BB][root@mail test]#
>
>
> ________________________________
> liudalin@kylinos.com.cn
>
>
> From: Binbin Zhou
> Date: 2025-05-08 11:12
> To: Liu Dalin; alexandre.belloni; wangming01
> CC: chenhuacai; gaojuxin; git; jiaxun.yang; keguang.zhang; lixuefeng; lin=
ux-rtc; linux-kernel; zhoubb.aaron
> Subject: Re: [PATCH] rtc: loongson: Add missing alarm notifications for A=
CPI RTC events
> Hi Dalin:
>
> Thanks for your patch.
>
> On 2025/4/29 14:27, Liu Dalin wrote:
> > When an application sets and enables an alarm on Loongson RTC devices,
> > the alarm notification fails to propagate to userspace because the
> > ACPI event handler omits calling rtc_update_irq().
> >
> > As a result, processes waiting via select() or poll() on RTC device
> > files fail to receive alarm notifications.
> >
> > Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips=
")
> > Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
> > ---
> >   drivers/rtc/rtc-loongson.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> > index 97e5625c064c..0c573f198f63 100644
> > --- a/drivers/rtc/rtc-loongson.c
> > +++ b/drivers/rtc/rtc-loongson.c
> > @@ -129,6 +129,8 @@ static u32 loongson_rtc_handler(void *id)
> >   {
> >   struct loongson_rtc_priv *priv =3D (struct loongson_rtc_priv *)id;
> >
> > + rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
> > +
> While testing the patch, I noticed that interrupts are triggered
> multiple times (/proc/interrupt), not sure if you have the same issue.
>
> I think we need a similar operation to loongson_rtc_isr() to clear the
> interrupt:
> regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
> >   spin_lock(&priv->lock);
> >   /* Disable RTC alarm wakeup and interrupt */
> >   writel(readl(priv->pm_base + PM1_EN_REG) & ~RTC_EN,
> Thanks.
> Binbin
>
>
>



--=20
Thanks.
Binbin

