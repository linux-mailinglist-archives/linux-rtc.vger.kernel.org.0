Return-Path: <linux-rtc+bounces-3500-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B14CCA62942
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 09:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4A53B0343
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 08:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4F91DDC3E;
	Sat, 15 Mar 2025 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEi9k/5t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA5192B8F;
	Sat, 15 Mar 2025 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742028538; cv=none; b=d6nWaoOHvVKnopZmB7mseKuGm7e+qxz7ypP8Z0/a4ZxQ++aDurF2a4k203lfEaTl5BxEpgsXNuUIYrqiGQF9/+UzG4rtC8jqWKET/5EnfJW7RBGslAjEc9TS5GjJK2o3AvLM0ik6dJYIu3Og969PZUMhG+ZseQIolHKnaavOscY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742028538; c=relaxed/simple;
	bh=cnjylHAJmZ101OxlO5ZN/g0D/KVAb26KvZRSU01F7d4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lSj/njvL6xXSAS0MpJCYqrzj8gos+Om4PBbYWsCjS0NTjshrY1ouAApKUTcdjI5AXqxDmmN/4lgGN8oWeJVow2kjNu4SjbAVqZ9G780bw5bOuDmKQ1X3ds53hJBGvcvJXV1HPTGwtkrWSYP9//g664sH9wQ39lC3cumZtBgnp74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEi9k/5t; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso5069505e9.3;
        Sat, 15 Mar 2025 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742028535; x=1742633335; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9XirSlC1lJUy9SGiwMwdj8q+6uR507R65gB4++UBGzQ=;
        b=ZEi9k/5tucAELDDh5m+f/eiPoBRKoRMKxP8Ix2ZH9gfzgLvKwRK5FTgXXleCdtwuVJ
         UuUAPTiVeTfTP5YGjjyAtcYf9pJWhQehJ/bBZqkzo55hzbN6Xvi+WaQ5wpLNhxb1jWMG
         0FnxRPzb/kfugcuWIlxsCvajBuaf4io8+dj87A/r4IaP+fSX8KEqF3V6ypUTFbDEjy6r
         KSFuamys2ppGKx2ryRkaYLmGX/ja2In83UzhuWnpMZnTHOppGM2Tb9fwEcGtpzLBUwEY
         9D1PiVGksDjAhd3fkCvU94TIY/uBV7wyNFElWx1m/WOjersL6He5K4EHW+HuEO+0LQYT
         ChjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742028535; x=1742633335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XirSlC1lJUy9SGiwMwdj8q+6uR507R65gB4++UBGzQ=;
        b=IR8Hqt8NdrcNh8j4QMGmpii+3x1fkrfClaAW83X1i3YeqtoHs4z95Gc8rp7aHbjA0g
         Ohh6bj1W81DnLd9z3BqXIZPPkBZkX19qzfd6eV4E+I/VaxhuGhbeTYIErsNdKhzqcwHE
         nteEwD9vk9xO9+L1H1TPyMQlCMp3Q5PyvJI2wNgL29mpKFPP52P9CWD7oVx5SAcUv+60
         DfD4LS2pNDDA/CHUDcmLLEsGOKJYwb4mDI2AeHtRPELzkBhROSkW5ni6ie8b1y8q2tu4
         ZmP83IxHtDXsIGv1EcOjXwFtlklUlu4CjJl6KnJJllMQ6Y4sqcEtv3af+YTC1n23Am3g
         ZbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPVjZMotPyWu5LhbUuX88/kY4tBpeMPuLFtpzWc9lcxhwKTxfwDSDf9k6TWu489AUdWhjVLvtLMU6X@vger.kernel.org, AJvYcCWeoWiYYSvz6tHIvhKYlkrTXALnK7VIEeLS7FA877ipmN8k+x7qE5H3f4e6C/TCqGQ/rGWHkaAwbtVw@vger.kernel.org
X-Gm-Message-State: AOJu0YxarK2QEMu5WbSMP+vgfrMR7QIOuMxs1D5DhNhCUqxZ1K0MBp8K
	OrDiq86/7x+RUEV89QeRAAo8UvET4Fl3E3W8tknkFaGbhoksWOe3
X-Gm-Gg: ASbGnctqeCaJB3inG6QVKh00mBmaUFai9GY6L7TNXneQ+6IrVMnEpYd6/IWa6QnodGA
	WvCQkUFCjSb3rYuFW6EMEASD3xm2RCpIJHsh0FP2m3HoyNuTt3zpBVcyCgH9+zBsiLMoYCFxxVF
	tT8xk1J+LZ1DgspN4r2Si9ins/K3xn5QPLATDmxGQkB3T+MKVlA4ReD1riElgHcdYP2QiDy6I/O
	Lm9NuPGsfKLwzNRjqK1H63rORqDeU7VAU/M3Vp5kIc4m/Q55KtYWU30KRmAS6RG2BqTGd8zawu5
	dg52IMrjvenCTxByN8r/HQwBs+0XfwB27MiyxhLya9q7w1RAv/2bQGpblmPtvA==
X-Google-Smtp-Source: AGHT+IEnlh0fk8XAAJTsh3EgMusKIJ4eBIzMXzyjrW7ZWcsRwEFBnmtJMkoF/+jsIlyvCz+lDXZWkg==
X-Received: by 2002:a05:600c:4f46:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d1ed0ea8dmr74052935e9.31.1742028534404;
        Sat, 15 Mar 2025 01:48:54 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe2a263sm43114995e9.22.2025.03.15.01.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:48:53 -0700 (PDT)
Message-ID: <fa218150facca3f1756b7df055f6e0e67130ebe2.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, 	sophgo@lists.linux.dev, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 15 Mar 2025 09:48:52 +0100
In-Reply-To: <PN0PR01MB10393BB0FDD18288E5FB18E92FEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
	 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
	 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
	 <PN0PR01MB10393BB0FDD18288E5FB18E92FEDD2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Chen!

On Sat, 2025-03-15 at 09:11 +0800, Chen Wang wrote:
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
> > > =C2=A0=C2=A0 W:	https://github.com/sophgo/linux/wiki
> > > =C2=A0=C2=A0 T:	git https://github.com/sophgo/linux.git
> > > =C2=A0=C2=A0 S:	Maintained
> > > +F:	drivers/soc/sophgo/cv1800-rtcsys.c
> > Please change to the drivers/soc/sophgo/.
> > We should maintain all files under this.
>=20
> In addition to what Inochi mentioned, please add the following line:
>=20
> F:=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/soc/sophgo/

Isn't it already covered by the existing "N:	sophgo" entry?

--=20
Alexander Sverdlin.


