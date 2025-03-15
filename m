Return-Path: <linux-rtc+bounces-3502-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76EA62BFD
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 12:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A3C4189BE37
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 11:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653E11F8BAC;
	Sat, 15 Mar 2025 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULNjWTaV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90717B401;
	Sat, 15 Mar 2025 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742039004; cv=none; b=iMUG1dvPmAPaKxMgqvN0QjrV6mNP9FnOcrTxF0lUcWYVG+rGiKJKxbx2TNCyqezd/b8Z5FazJipGFJFSeeEIMnD+iGQ/WLUfvURQwCD6IpC4UuxDNt/1nPIlJYiPf304teDfSFe1QbUo68kf4eXi+4L28PetN3MJAbaLSntWadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742039004; c=relaxed/simple;
	bh=u+8nz41tlYU+O8V2Nth96DP8B0RudPJweXoeqM7XfQg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tzQ8G7mLHcrqKZYhdOU4jlX8dmnNKG7YkF92e0utuEyM5HtvPB/O2PmgVdfvV9gLQFdMAFbgnM/CaKiAuxyzgNKP2VO+Yozsf1183K3eRgLslExP+flSg0z4jr1WFGBOfj7QabAV5ECMcfAdfYDPCD4279X3kTeiMzysM6vEKUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULNjWTaV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2ed007aacso584653666b.0;
        Sat, 15 Mar 2025 04:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742039001; x=1742643801; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KeZdUQ87/QjVva6B+nN47G0ElGSAcZt31jSmqIfddsY=;
        b=ULNjWTaVfDmZWVzj5J0fylC3TnoKPe2rFFQjMvEOaIEKxzRVuvgKsUA5RO+Brot8Bi
         zw+0KzcmkmbaIOOoy7gYPKT8E7LqJ8p8/+cS2Gdna7Xo/ewCqkARi9du76pPq4A5xF12
         iNQnb/ny+konc5wGfZbfXcEla+F8o+2uXkj9PvgLcQ9BgLGk/3LW/F8av0p0H+fL7qeh
         RHfoFffLbTr/eNLhm/5Bm0X92Q/7jdXvYxHEAWqP4PheDs5oTYXrHw2IqkLNfBF5/J9l
         gqhDN9TOF1J/3fO3zTjRtQr9g+kXI+xNquV2QpciYjXGObckTafVX2Btp2xJ1J+TUP2n
         ljBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742039001; x=1742643801;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeZdUQ87/QjVva6B+nN47G0ElGSAcZt31jSmqIfddsY=;
        b=ctMlptnSdhehS8jE1zPxGDNl1mqmCR0kV2T/mzxw4GvU8R4pij42Gvix2wp9FMXshG
         3TVgk9Za+G7Ms8uEYdl13+1RclS7N9Ve+kRAqfaxW7EvkoxCEPEjx/F2H0sIOJT6mvMt
         4OdxZyfkLRKn5477oXgL5s6Y6gRVfjEK6yuO9B4cXJznwsUanodedWSjadfhLNo1E0HH
         x9byT71CnMq2ZME+JOQOzMlJOq8+783nnwGGQH0jo4lzFtIkWC1GwS3JHUHvz0wgQXRg
         4XLNPhwwqPcF3dRrNk4kuPc1DgNV8DByEMoIIAerRb1Hficqwrmdz0GCShlmyd+gVTbW
         xs3w==
X-Forwarded-Encrypted: i=1; AJvYcCUX9oBEZWmKIU5bvqzBJ1D6GKk4/7oRf+6ZbR/QRDlVUsTMjW/wBDey3koAtAsLjdqrD4MjG9zToxGS@vger.kernel.org, AJvYcCUZSCHL1DWH3xSB9gZ8E3uIRWvR/+nyTr4DaYtGdaSLiBYfGNYwhYkg2wCNO4xcT8XRMPspL3PJR9Xl@vger.kernel.org, AJvYcCWTU3o+mlZy0fIfgx0Loe/zSSUR9koyi0EdaLiUivwC4YUxHKBLJ33wTUnVwCsv9mjImnpazxTw4ZG2eHvk@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfklslDmzKvC23/wyK/jcINURa9qC9LFXjj2ta7XaIpLvgQ6B
	bUswSgFPbd1/GeQ3sMdN2Eoc35bKVb8j8eDLVvuoNvJvpppdOzri31v6yw==
X-Gm-Gg: ASbGnctwTfqGV47zaQ9GgqYg0JpLNRBXatZk23HZPJrfe3ziq0nrhyAjpb8Zd2QvjdG
	3bAwKg2okGXpB0qZYiLXjZallmUdz8CPVCfgHio3AcHDJfzqMp7YuhQc9RNTY3NZe+mu5LuluP8
	DQQmFZJ57zwsncLVohxAGUJu9RR4J0ZbOZ/bGYM9Y8SpTuIHUu1Xr1srFi/IOALJ1ZrPK4OfbsH
	XJctD0q6A2KFzS7/TxHgI4MQvAC/EA9q83xgMDZGyQoxPEBlinyntRb/BydkXh9U9kper81MsLJ
	bhF6AlYBvSK8QNoDkEh5U4Amqcu8I4e/Ptl7X+xDh5x4qtRv+4vkMxy0lch3sw==
X-Google-Smtp-Source: AGHT+IFaeyv1G/kQsgkk3HcuD0eS+l5qBHWMhAKtgepFyHyO7M9qoxSUruk53n7H1dNPe4H7TK3gQg==
X-Received: by 2002:a17:907:2cc5:b0:abe:fd0c:68a8 with SMTP id a640c23a62f3a-ac3303e6721mr580478866b.52.1742039000613;
        Sat, 15 Mar 2025 04:43:20 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ce26fsm358549366b.89.2025.03.15.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 04:43:20 -0700 (PDT)
Message-ID: <a824d6b57ce5a9180a45c3ff65b4b9051ecdc1cf.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>, Jingbao Qiu
	 <qiujingbao.dlmu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	linux-kernel@vger.kernel.org
Date: Sat, 15 Mar 2025 12:43:19 +0100
In-Reply-To: <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
	 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
	 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi!

On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > machine to control chip power-on, power-off and reset. Furthermore, the
> > 8051 subsystem is located within RTCSYS including associated SRAM block=
.
> >=20
> > This patch only populates RTC sub-device.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

...

> >=20
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/soc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/soc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 drivers/soc/sophgo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 24 ++++++++++++
> > =C2=A0 drivers/soc/sophgo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 ++
> > =C2=A0 drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++=
++++++
> > =C2=A0 6 files changed, 93 insertions(+)
> > =C2=A0 create mode 100644 drivers/soc/sophgo/Kconfig
> > =C2=A0 create mode 100644 drivers/soc/sophgo/Makefile
> > =C2=A0 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3eee238c2ea2..ac15e448fffb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
> > =C2=A0 W:	https://github.com/sophgo/linux/wiki
> > =C2=A0 T:	git https://github.com/sophgo/linux.git
> > =C2=A0 S:	Maintained
>=20
> > +F:	drivers/soc/sophgo/cv1800-rtcsys.c
>=20
> Please change to the drivers/soc/sophgo/.
> We should maintain all files under this.
>=20
> > =C2=A0 N:	sophgo

I suppose my F: entry is actually superfluous because of the above
N: entry and can be removed altogether?

--=20
Alexander Sverdlin.


