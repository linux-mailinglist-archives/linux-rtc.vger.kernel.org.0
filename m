Return-Path: <linux-rtc+bounces-3504-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00317A62FB5
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 16:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E51E7A2321
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 15:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A145C202F8E;
	Sat, 15 Mar 2025 15:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLdvhzir"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB201F790C;
	Sat, 15 Mar 2025 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742054162; cv=none; b=uAx9wxlJGSwH4dbUa5xQocViNHSYIUOPlYKFnBnjcqHZVA9uYxVzIwCaR5LC4fTMGJ9pDLONUUUMKGssVkcGBODum04Opx/saLsljqtrfygrHXSXeXmFyP+Q/KzInr95qr6TMOLN/VCrGEot0arf7M0OBghfoYSooAvtaBydch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742054162; c=relaxed/simple;
	bh=MRJjZ5O1bWjVu2eWngnjmrWJQHQGwJx7tix5FKfUILA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fyj87/jR0xW39Vk4RgL0nvSViH8b5RIe6PMZZtROCyJQ3yMQJR/Lj03aejkPBIv0ibKqAaKqui61Nn6zyCiSvICppNi3q44eaKcBwDxXmCAOCLYlFXYKiWJ40v+7wf3di5pc8tMzSEpYjGjLQ/6eXGXh8mb6EQik7BWuo8p8nc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLdvhzir; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso4846235e9.3;
        Sat, 15 Mar 2025 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054159; x=1742658959; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qHLhAyyIe2MeT11eZPTmP9X5jZJNkxRaVxiRBPcxsAY=;
        b=CLdvhzirFJtxuIWyWbf92+Np/Wznl8lkDdCf2dXVabItEGsoFKReWPbyreYzNxbf1A
         XVlUzitNpZ8LYVFgkyjKjmTLQ9Lxxji7SiOeYzEirqpiQ+kBL513G5nwHpm55+AoUh3r
         mgTAVxI2VqRkSfixNCODKqvaejjnC+o9ceU7qzflcNrzkeQauDm2ABJmLotBMsaBBJwR
         geporm2ea6vIWjXhLmW9G78oOeqQpFgSwLcg5f7ojDc/wXoZekdekKLRy/lsmbgxJ0D1
         0CqqdMv9KlFFWc+uqv2IA/iXjSlRxmnkAt0b6sEdK+W0eCXJcQTKdvgebFJ2KZOqc1x9
         Bejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054159; x=1742658959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHLhAyyIe2MeT11eZPTmP9X5jZJNkxRaVxiRBPcxsAY=;
        b=MKz8c1V4eKco9G7dc+HZWEQUk9mTb9Wz89BNL9Swofi7QloPyjahFZi7eujlMXAxdS
         VFoOxqe6AaXNg6F3IjD3t2yvGI0ygZoPZDCdlqeM2xsIrS92Pc5T9UKdEBO7hTwwmLNZ
         WrFBgRugCsm4VeuZG1WRNlvy/icI0ucNgKcLH9UMG25J0pCpAYvNBlKsJJtc4mFUgLXr
         36SeEBenJxBHV8DW1o37y12+0gQT3PT5qGpjQ11rL05BN6S46WvWD/jiko161oUZXWTN
         XotmrbROhcnO61rWJ+eiAalluOf8mXe4Ld95dReqx85kguWwLMHuf3uPv1OVgEQHOaXb
         hnsg==
X-Forwarded-Encrypted: i=1; AJvYcCVvuHQjTeqxuKKwvnDqGAL7KmcmmgGABTm3zPhYeMigaJZvMF3+gNGgTnZUr4oQMblR7V4QpdvPeoui@vger.kernel.org, AJvYcCXoODcsKCa0hrzUklN/Z90eb1oios2tZHwjFpPAHRILM5jEF2tXy/EmtqEhXv++1qkLE+rCSRy15vaW@vger.kernel.org
X-Gm-Message-State: AOJu0YxIgfcuh4X+nqvf5ryvf3Wvp5GXiKeHt4rVsmT/vbFECsQ1vyyt
	n5+h0f8xSH6Ot4RMGkrRxqDinNoFbPRM8cliR8a8XUbMhb5HuHWsW9tB5w==
X-Gm-Gg: ASbGncttfSqUL6p+TozzKJRoKNHjGKR43J5v3d9qJhTVbIKwO9Ok3YZPDFUhRSPQjuw
	KkfdTkuD8kkSXIHYiQNGg5pB7ucIDZVwyczViOL4bw8pkW0PXtCRSckOVrvapBF9kNHColKXvmR
	05Zjf71gcn9zTYhfkIelSCmaSnENjGHJ8H27idfv6U00vLnNs+EF+vpyHwSkKUFKdfNRZ4ZY+zB
	lhnokBv5ph3Mgic4vbl1Q2TdWgUdPfdyELAAMf3eTCD3aZAqPvTHoKzzHl7AtHYNATaGwEBpior
	cHTtgpKJtQFiNdL1v9NeiiN4TS9EH+CkfZbref2Xc3CQ5RXK4+n1p0+h6mCzmdk+70viDgCC
X-Google-Smtp-Source: AGHT+IHDnn8P0rTvJZGxr/bBa0NVdDYyh7DnEmDOEsVUcOLIyJnBFWm1Zs2TA7EjVueh9oZiZymW1Q==
X-Received: by 2002:a05:600c:5493:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43d1ecc77f2mr89127045e9.15.1742054158914;
        Sat, 15 Mar 2025 08:55:58 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe524ccsm53978805e9.0.2025.03.15.08.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:55:58 -0700 (PDT)
Message-ID: <99b7f8181abda40c78bab67cb5a4b00b62851b14.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 15 Mar 2025 16:55:57 +0100
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

> > +++ b/drivers/soc/sophgo/Kconfig
> > @@ -0,0 +1,24 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Sophgo/Cvitek SoC drivers
> > +#
> > +
> > +if ARCH_SOPHGO || COMPILE_TEST
>=20
> > +menu "Sophgo/Cvitek SoC drivers"
>=20
> No Cvitek, only left Sophgo here.
>=20
> > +
> > +config SOPHGO_CV1800_RTCSYS
> > +	tristate "Sophgo CV1800 RTC MFD"
>=20
> > +	default y if COMPILE_TEST
>=20
> I do not think it is necessary.

Maybe it should have been

tristate "Sophgo CV1800 RTC MFD" if COMPILE_TEST

like others do?

--=20
Alexander Sverdlin.


