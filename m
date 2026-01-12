Return-Path: <linux-rtc+bounces-5738-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E441D12BDB
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jan 2026 14:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16BBE300F666
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jan 2026 13:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9146358D19;
	Mon, 12 Jan 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbiC6jaH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D73242D7C
	for <linux-rtc@vger.kernel.org>; Mon, 12 Jan 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224144; cv=none; b=A9a5GkHzf3vWbt18J9gzdTqdNuFZjmigKLi+dEZmNIJeSTwGWpuA2jMxvh30feqTMLMD3AK/T0wiDzD7IuoAASUi1vRA9yEx0Ox8sZ5BjLduQIzJY+ifLKgMOndjrBqQSdvPSm8I5Hz+To6t0z/dMzPhcIHQATb0tiSrS1WBYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224144; c=relaxed/simple;
	bh=Moxv5L6gKitMqxtkTShK6QbHpBnPl23MhttLnlpHmCM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aGHEy2nc/GCY2Q7r4VLit4SnlGFm091SGsMI38ZvEM34JYs+dnE4UktmEKKiyp2lK90ks+UBM9ypV0++brD9AzGYet0Slk2WvHJ6HEYZq/PvhvNkpccThjPcZ74YRsa5u7PVKQiEqHnpv0uUgkKdL00CYs7216dOXN7kDvaz5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbiC6jaH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so53505055e9.2
        for <linux-rtc@vger.kernel.org>; Mon, 12 Jan 2026 05:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224141; x=1768828941; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbNybK+wu77HDIdVk759hzyCoUVJOdCnedcWHepqb5A=;
        b=UbiC6jaHw/bLwRx+55G54OrKjMCmamUJ/6EMPZodWt8O9Bvpk2Bnrf+DT5N9QWmPjo
         hpjEnzohRF4MRsXws32mHnI0Agr3/aOIbg3t/mb+eXBvsToyJZQWt8JxkhXS7gU3wK5p
         UMUWM3+yr8P+4dcSJA/45yStdmrNGbKMYsFsbOJTD3IfrCuN+5WpoTWqRkZBR7ZvhoWg
         Z0jw+46r/Rcjz9h7DfcLBb10LbC0Gbviw2Jb7C9IkRClwM8gvjwlmall5a2subD2WUto
         JSYeuYroBRbB5rxNi2pQbFn+nMBgnNKc1b+sTEFkQqal7gHV9FIpipG6mEUTZbOrKWY5
         TMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224141; x=1768828941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbNybK+wu77HDIdVk759hzyCoUVJOdCnedcWHepqb5A=;
        b=o/jkWA+JdxVYULH920aMA7KyTYdDmuz7gUzE5gCLUY9a/qymN5bs0ZN1PNNmHa9git
         QKwOTSracR4pkuaZQguVerTab8kFgb6l+XuIqMmjS4buPYIfyEHADZwNl17kfX0iYrVz
         MY7YPd+zBU3+YUhQCX862ypwJM0bMtKu5NQE3VBtjQW2wT00I5YRPZ5K8Cn6tDzlKptI
         mOTBp+s3EilpqfIhzFaOgsQHs6TTyplNUwf6JHlXgQtbPqW79sKKLpdBencRvaINVynq
         CYDYhkB/GQG/Gy9AZqSzPtlGFFyGy2Eg4FRrErSXnfU6/ZGcyZbHHddA1CK+GzI31Ga4
         qXsA==
X-Forwarded-Encrypted: i=1; AJvYcCXgNPH85+86C7EbkZ8DKGXysjAq+Nt/lqZaPVfBAtGqUhOJVnFZCY9FGeWEgoSo3sQ+0z1IcIpxP70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zgEITfCcHA/icsTxR71xQHLFZnXDMemP09OVCzT/s6DDTIwp
	VO4xpSqkuU5bB6HnU4fsChIAhZk/n6/hLYd3FQYf+tOGfK9pRtR294ef
X-Gm-Gg: AY/fxX4Rjg4LXcdo9KaSJBe3hFuLCVhLroXj2krrvYbzFRgcoKHf0sL1eH9OIgEqjWL
	MmO5QQFTNJtwnPkWLyX+Jw8TETLlF7GjZ/qn0XfmbOUCM2fKEPpaiysFeT8CLGtATa1iOZiePqq
	6oQk7i81nUdL+9uCDvRP6SNC8qaT2daSYR1F059acgrAFcsvs7NirXULavPhm/wTvVPRn3/8ynF
	/LibuqoVO3UHPTAnZJsfnZKVSFtqYem+NXFp2GwjUMemKtlAeR4rqPDKxAWLeEukD5Rb9CaQb/F
	e20FEXtbn/nbCRZNZ1EynEO5+TFZxWGF1VqT/7tKI0e6HVa3efuK8Sxh1ZgzIOay6uivem2PeNt
	gOSNkxoXfrMbqniDuGa3T33mYVjBN9hRltxeOKVW6as8d7ehxm4tp4etlZIdlrFqyQZGksdEFRK
	y/Eli4siGTGWcTj/Ib83daYREJhiXxdg==
X-Google-Smtp-Source: AGHT+IFmeX6pltjb+KA7Z0DIhwZiW2tH4kpei0Oyh7aeIf5bNLDc0BBRwzlMJAUBrb1pUoIf4jR59w==
X-Received: by 2002:a05:600d:103:b0:47d:403e:9cd5 with SMTP id 5b1f17b1804b1-47d84b1fce2mr151146825e9.11.1768224141333;
        Mon, 12 Jan 2026 05:22:21 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm352464595e9.15.2026.01.12.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:22:21 -0800 (PST)
Message-ID: <a9a59334e29ecf10ed8e6d737e5b918580446a69.camel@gmail.com>
Subject: Re: [PATCH] rtc: max31335: use correct CONFIG symbol in
 IS_REACHABLE()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Date: Mon, 12 Jan 2026 13:23:03 +0000
In-Reply-To: <20260108045432.2705691-1-rdunlap@infradead.org>
References: <20260108045432.2705691-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-07 at 20:54 -0800, Randy Dunlap wrote:
> IS_REACHABLE() is meant to be used with full symbol names from a kernel
> .config file, not the shortened symbols used in Kconfig files, so
> change HWMON to CONFIG_HWMON in 3 places.
>=20
> Fixes: dedaf03b99d6 ("rtc: max31335: add driver support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Acked-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
>=20
> =C2=A0drivers/rtc/rtc-max31335.c |=C2=A0=C2=A0=C2=A0 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> --- linux-next-20260107.orig/drivers/rtc/rtc-max31335.c
> +++ linux-next-20260107/drivers/rtc/rtc-max31335.c
> @@ -591,7 +591,7 @@ static struct nvmem_config max31335_nvme
> =C2=A0	.size =3D MAX31335_RAM_SIZE,
> =C2=A0};
> =C2=A0
> -#if IS_REACHABLE(HWMON)
> +#if IS_REACHABLE(CONFIG_HWMON)
> =C2=A0static int max31335_read_temp(struct device *dev, enum hwmon_sensor=
_types type,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel, long *val)
> =C2=A0{
> @@ -672,7 +672,7 @@ static int max31335_clkout_register(stru
> =C2=A0static int max31335_probe(struct i2c_client *client)
> =C2=A0{
> =C2=A0	struct max31335_data *max31335;
> -#if IS_REACHABLE(HWMON)
> +#if IS_REACHABLE(CONFIG_HWMON)
> =C2=A0	struct device *hwmon;
> =C2=A0#endif
> =C2=A0	const struct chip_desc *match;
> @@ -727,7 +727,7 @@ static int max31335_probe(struct i2c_cli
> =C2=A0		return dev_err_probe(&client->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "cannot register rtc nvmem\n");
> =C2=A0
> -#if IS_REACHABLE(HWMON)
> +#if IS_REACHABLE(CONFIG_HWMON)
> =C2=A0	if (max31335->chip->temp_reg) {
> =C2=A0		hwmon =3D devm_hwmon_device_register_with_info(&client->dev, clie=
nt->name,
> max31335,
> =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0 &max31335_chip_info, NULL);

