Return-Path: <linux-rtc+bounces-3208-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB4A35C29
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 12:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF3223ADEDC
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 11:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DB525D540;
	Fri, 14 Feb 2025 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bruugF+G"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DDE186E40;
	Fri, 14 Feb 2025 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531383; cv=none; b=Au/zew28pQaDT/lIQZ+rJOzT32opS+BwUqTntjbwHipm5B36Eki3pyGHH5Pxtel7wEIyD2/zt4t93j7a9mttGyMhI2SSbRXnWyniy8x4U7bU0teZO9rYJC/pwyOGDKcFEoJ2DRCOU19jllUu++gFyADZnt/HCvChzUvFx81yb0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531383; c=relaxed/simple;
	bh=aigpur5if5MSlLy9b9P0vOHm3NgsJ9o8CLycgKukS10=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fF/wnRAhYVc7I4Ws7H0miKnLHpuWjjtWFaL6WUQDHIRQV0dJ2GrKEOHX6nUTHePoMi3SmLA/1zzdTH2KXhGLt2CxWBmuCfcuPNkmQn/AefSgGj75dLLVQwGWeUltjWZK16Jybt263xGlrNEE1ZGikMEPvzLer+jM7ebanK9A3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bruugF+G; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7fa1bc957so355351566b.2;
        Fri, 14 Feb 2025 03:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739531380; x=1740136180; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aigpur5if5MSlLy9b9P0vOHm3NgsJ9o8CLycgKukS10=;
        b=bruugF+GCbhCVYWdfqjzRMp3V2M7kOa8+VZJRX+T+//TO6/SaRXDzKarG1eH9mTkFd
         FiOrvRMLvhDDHFKhUOtmIt7MvVgEA2LOK+hFX3B/fPJljdxWLWKnuPqbkzvYDzfw5Gcf
         YfrSS1aNWhZ6arORMlk6PoITbdgR2cd97lt5Ozxby2p5DK2LRQTb6O+dNhozeXipfj71
         LucZTco7useBEbveXC80dN0hrViPXkwCd23mG8YVL3rrS27tCZEi+7d/izJ5L9NKPmZS
         uw2NE0qrCILbTuwyIx52I1JyrNcPuhlfJdyPAiaKxa1X0yCzZtUiy+MtpoBM1HKM1TW+
         amHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531380; x=1740136180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aigpur5if5MSlLy9b9P0vOHm3NgsJ9o8CLycgKukS10=;
        b=oOsLA3MgA9SvngjIgEwU98JXgwyZw7VhPrTSp1D2+wjAOlX0UX8UCsTJnGgbowXpFT
         buQmTi+CYDkGkvVyyApmGK091lSaZaWJ+NXgHpaozJ8Gmt6cZEoS4ujUyAGhk+OLht41
         JY+5v1hClYA3ocw4ZWV4yxPt5AkUg2ehEl+OBQzWo0YsTBlRa2HX4D5KLBOo6G+tW6PI
         vTT9+YOz/zrrCZfVFsxiyWmU4TLHahstDVVLplyOBN0J8LH4KwQFZGzbrvJ2AJsviD+t
         Y3fTmj5MriR3uNghwoHr6PM/qi3dInuZeb3m7BYCTnBzYM3U6wXir4yepOQOIKYx7xVk
         yTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWHnyWISwNe5UtGSR1mCcdTaQNUN2ZRDoICXYsO7DyNHWh6XPJw8MuDPJwYbDG5aro+uYkJNzRhw7fiZrb@vger.kernel.org, AJvYcCVeiK5+lagghVZdkH3o3fvcCwYppjTypgTQT+yref8NXT9Ci9eiUH5bWsqkAIAmFJVIYKMeQTRaIhtE@vger.kernel.org, AJvYcCWLHEQUwmInaCw6bsSJMgp2Or/8Fay4n9jwULpN5vHJKPqXuDIpychwA56dRlrN2ko0lmv0GcUtkhS1@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwJstWlgzpHohjHaNprxWtf67zzNWjL7OWUWTo0g6UQIsH130
	0OSNA0J3p4B1xlp2BAeu4sBKU8qZYwcObRzlVm1yV0rCIM2m82gY
X-Gm-Gg: ASbGnctjYL1YmrX1Dto65luXqQp53GoEIde6zxqSH5hqzaK2oCSfTyJ8/9SyZ+QUkiV
	d8a1PGVBl4Hwoh6On0BZitbQdDsEwNE7Rnn2ZF+5YB2XlNI8gfHwcRIKcwxWo9AupW6YQ0CmXv9
	vogJrdNQCHvW0MykFHdtrWH8yT3LT4rhg+W38wH+MIhRC/ET9liNurrl0kBM5/Kc+KidI0qnh8d
	fvXWLP3/JP5XTIkirrDnYRu993xWTtzMev7+umdN753eEg+RxL0PfI4lOzhZCHB7SEerrT/yE58
	mC0bVrqivB27zGyLNNc9drwG97zhBuio
X-Google-Smtp-Source: AGHT+IEX8u4B+i9w7ZDW/hBhkVNRcW+7tzz1yY2Ss5mruSCSTtkcNIfQ5b1LN+2uvhhVxWkQSF0igw==
X-Received: by 2002:a17:907:3e9c:b0:ab6:da18:9a3 with SMTP id a640c23a62f3a-aba5017e3bcmr646004066b.46.1739531380181;
        Fri, 14 Feb 2025 03:09:40 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm2746739a12.58.2025.02.14.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:09:39 -0800 (PST)
Message-ID: <964a016b944b459a9a914abac539350769323259.camel@gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, dlan@gentoo.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 12:09:37 +0100
In-Reply-To: <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
	 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
	 <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi,

On Fri, 2025-02-14 at 17:40 +0800, Inochi Amaoto wrote:
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +=C2=A0=C2=A0=C2=A0 rtc@5025000 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "sophgo,cv18=
00-rtc";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x5025000 0x2000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <17 IRQ_TYPE=
_LEVEL_HIGH>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&osc>;
> > +=C2=A0=C2=A0=C2=A0 };
> > --=20
>=20
> Just for curiosity, Do you leave a way to implement the
> 8051 subsys, since its registers are in rtc. (You can
> check the chapter "8051 subsystem" of the SG2002, which
> can be found at https://github.com/sophgo/sophgo-doc).

well, I suppose, you know the answer, according to how this has been modell=
ed
within this series, all the functionality could only be added on top of RTC
driver. Do you think it's time to re-design it as compatible =3D "syscon", =
"simple-mfd"
with children nodes for RTC and reboot?

--=20
Alexander Sverdlin.


