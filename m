Return-Path: <linux-rtc+bounces-4691-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0118DB2666B
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 15:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687335E2BF6
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 13:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5573002C7;
	Thu, 14 Aug 2025 13:07:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EE2FD1D9;
	Thu, 14 Aug 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176841; cv=none; b=Nq1mdrfxA6lIeQCTjd0evrrCoGoCf4lqfLTC436OLy2SdEjg5nLsw/S5CttZDvrxHd/4w955TaENNp8sTcWDnv21zNAYNN/klUfj39d10eWK8jGrGLoch29ZbHIlPQrweZIFtxO2eu94EMBeWLJv19Rak4AgsZRdmX39YiOOxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176841; c=relaxed/simple;
	bh=PKcSZQ4ipFczTaWb2tQTT3R0z5gejcAuUKoB9Ktsqcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bi+d60KPLqrRstmXFFlUTXOFFekrEu12R0M4f027WjHlvTYnLF+5vvj8HhmdDK5J/DHGT9zyHNANcOOJB+ZEuwL8lwMXAEa240zXOy0VwVu5VGmUFlexcdUPy1lSHFetGqbzKwMlbtWphuCpLI6n3dKH+CL8b0mwjPq6xMbrjsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb61f6044so170094466b.0;
        Thu, 14 Aug 2025 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755176835; x=1755781635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFUrylcigol2hllrcza769/tLyOk1d4CmbqHA8zoLyw=;
        b=QxGq0CcfJSHaSnGQJXbvwnJKX1ZRudptteEWtUg5M9EvvV3cy+rC6gs9sr5A7RNylS
         Znnc8OcCLqxaK2xes/w2THUPkxdLG7+floyIRI0ox3TL4Azm07uhqJ1493C1Z18Gdw3L
         NBiyQF175+pquzRNofT+G6pkDRnAr67YEgojycjVPjoYenIQwGD+fu3Wd4dFSeqAA4FZ
         OB6kg6Hy34kDA/p9RyCo89OLIvTYa+7z+wJAGNAmlvjGZGMZ6yNXctLuGZn8GgVcWtjA
         IdR+MEXio37uLpFXSTErXtkBnL12Q3BRS+hg3WvBZtyK8EROiaz2cnql8Zd6lqMFaRK6
         kucg==
X-Forwarded-Encrypted: i=1; AJvYcCVjrNUingE8yocG/e1Xrc4VTd+IdkfS3IwU6aT5sElwzu5wcLJ+ZBTNQtjwZT1ZpApChWo9Yt+2Y5PR@vger.kernel.org, AJvYcCWzDoL4mcx2fj1vZkqhxw5AScK6uUZAl8iCYBKXUTSf649ShqU8zBrdrwzgqGAsw11/YSWr0VBZG+KTGWbt@vger.kernel.org, AJvYcCXnCV8RHn/LmsT/rOEHr5rg4GiPhO86nDsNDxyP657KIw1GH66T00gjqWB+NDac8M4oB3LxR9susNek@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5DnPNvYeNQyWd5AIwBQT0wksgpo+o4U+seZ/3VzZ5sszLVFPW
	IOqa2Wt4P40GnqtEbb3D6wW0JTehpglUHkdIdPlSx5UEQX5o8+FU3tkLoJqLHMhIpaw=
X-Gm-Gg: ASbGnctWIjbeHA3SUg9nEibh1NvQnUTUEyWp3cDntY/V+Atfu8X8FnX6nmO8TaqTEvD
	u1ObJ5MW8r9tpSW5+hoL7e2HRRoeBS/V+8KEraA3EUyvQ5MkPGquARsMK4Wq59ZkqkqeEnXcRMO
	gqVTRsQl+WOU/wMK/o8LF1Pj4wlSNARs+k52RCkpSi/MjGvagJ1tgrD+bg6COpos7Tpqr8zAoUj
	eweVpWJZToGregWC9NBFDFCuzJGTHrpL7iBPQW5l+b1ATY6J1fn8hwre3BiSKu8dyodE8MniVGd
	NvlBkihb4EVaXHFzd354nbKlGHoPhnnw8SUWSoTpie4QoEO0Am/XoCB4wOzzLXfy0Jd0X+nONRv
	jtAsjF14WmiZ58zGhjTTfsZ9Ln/wdeLO3I6RoTvMZzbyTaKTETAYZ
X-Google-Smtp-Source: AGHT+IEh8ewfHG9gciJUmmoUZBD9xaqv48Dvi07ch0G0vtVoWjSGhsm7LtgVe6btXF9drZMfB6XWnQ==
X-Received: by 2002:a17:907:1b13:b0:af9:23b:9f9 with SMTP id a640c23a62f3a-afcbd89cfecmr230890366b.24.1755176835203;
        Thu, 14 Aug 2025 06:07:15 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a38aasm2599402266b.37.2025.08.14.06.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 06:07:14 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188945f471so1993942a12.0;
        Thu, 14 Aug 2025 06:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaU7PsUSQF2wElognPF4Q47253/igRgua98qRgZR32zQruTcqHO89Qyn4uRi1u6FVsUWWIFVpQBcIX@vger.kernel.org, AJvYcCWJ68HfEtELqBY9nnhi55z8DavHnsmBEsTxF2Vgy/O+AbsZFmKugxunD7LSxAZ2RwpJGY4g78bVBNb5TNWt@vger.kernel.org, AJvYcCXAWflTivH6IPYWg8cs2gFbRSf9R2ml5B6OiQYlzPhaYWXpLugX9IyekxZEphu+JHhT+q3NLEpxrKCZ@vger.kernel.org
X-Received: by 2002:a05:6402:5206:b0:618:3521:6842 with SMTP id
 4fb4d7f45d1cf-618921e9bfcmr2202592a12.16.1755176833833; Thu, 14 Aug 2025
 06:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
In-Reply-To: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 14 Aug 2025 06:06:35 -0700
X-Gmail-Original-Message-ID: <CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com>
X-Gm-Features: Ac12FXzLclnfzNMdgfWr5WLv-lJF3C441CLYE6NCa_SPc5-EdJWTW2hkFqFeYNQ
Message-ID: <CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Apple Silicon SMC RTC driver
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:25=E2=80=AFAM Sven Peter <sven@kernel.org> wrote=
:
>
> Hi,
>
> Now that the core mfd device has been upstream I've prepared one of the
> child drivers that is still missing: RTC support.
> This driver is required to read and set the hardware clock and requires
> a reference to an additional NVMEM cell to store the offset and thus
> requires a device tree node.
>
> The series applies cleanly to 6.17-rc1 but is based on a tree with three
> additional commits to add the SMC nodes to the DTS which didn't make it
> into 6.17. You can just ignore that and pretend this is based on
> 6.17-rc1 since I'll take the dts update through my tree anyway.
>
> Next to this SMC child driver we're still working on an input/misc HID
> driver for the powerbutton, a hwmon driver for the various sensors and a
> power-supply driver to manage the batteries.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Hector Martin (1):
>       rtc: Add new rtc-macsmc driver for Apple Silicon Macs
>
> Sven Peter (2):
>       dt-bindings: rtc: Add Apple SMC RTC
>       arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
>
>  .../devicetree/bindings/mfd/apple,smc.yaml         |   9 ++
>  .../devicetree/bindings/rtc/apple,smc-rtc.yaml     |  35 +++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   6 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
>  drivers/mfd/macsmc.c                               |   1 +
>  drivers/rtc/Kconfig                                |  11 ++
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-macsmc.c                           | 141 +++++++++++++++=
++++++
>  10 files changed, 218 insertions(+)
> ---
> base-commit: 772c260c9c7f916c9a2508839df4f03fc19f3773
> change-id: 20250812-wip-smc-rtc-e856b6f24603
>

Series looks good to me, thanks for submitting them!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

