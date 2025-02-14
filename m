Return-Path: <linux-rtc+bounces-3205-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CA3A3597F
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 09:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77BF11892B41
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 08:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEE922A4E8;
	Fri, 14 Feb 2025 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8x9V//2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3B22A4C1;
	Fri, 14 Feb 2025 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523407; cv=none; b=kiHUqWrnpm29Oj6oJT2/xZo0uoXsyFUp1EAYkEIbfkgSG9rQtKcY8D1YlXdi53KFDwYd0FVu7xDaC9WWd6lQoGQhb0ZmHbD5hmLQ2aAwQd5pq1VSUe/puNh6kPLuiplkFOlTV9bSp1KCjv6Ul4V0LspLjDnls8ySedyXvgLUKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523407; c=relaxed/simple;
	bh=9Kqb/+zQgoNRtarVFNZ+/aOPm1SAV4qBUOpuNnZj7rQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YVwHD21OUuE0Jg/xZUff1u0GXnM8mHPkhjAYVtkwSyM9UF9YT6qYhic3X6zkKaZZmJeGC3jsTMlxINphJwjlsmHLBfyNx4p+/YYsF76dPTAJlZODe5qR/wO11pBtwtr1MNDY2KFcJ1wiZiITGWegbNBwX8tJA3EkyLi7B7oban8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8x9V//2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso3106559a12.2;
        Fri, 14 Feb 2025 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739523403; x=1740128203; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Kqb/+zQgoNRtarVFNZ+/aOPm1SAV4qBUOpuNnZj7rQ=;
        b=O8x9V//2OH85h1TSVAliq1gO/g2ipvvn5G/YMMP46u5FlmlbiQ8JpoLIwyum4OxLyv
         tAbPg1X1FD6A5SMfD2j1IiYh8X87kjfd72FucyMU4M9FGJN3+bXI/EieT1IwkIPR2Ffj
         fzsEUvPllv0uwmuQdbnG67XdWCX2jQhrcVl+89gzoaFmPuhSZuwJMvQc3vsH1Rf6K04V
         vwPAEP4PncyvkYy72jOP0AjI4JAtp0hfB/eYF73SWIbDb5TN8y50topjXZ/zg1+3/fFy
         NdnbUGi++58n2dR/yKf6KKoWVr2NX+x6JWmyMXCcMsauNkKZ5sPz9wJPfg8IusJsz/ex
         +pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523403; x=1740128203;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Kqb/+zQgoNRtarVFNZ+/aOPm1SAV4qBUOpuNnZj7rQ=;
        b=YppGSt86dTsTdS0yfX/HLLk8x2SJon4ZgKqtgzWug5Cji3ekI8e5JLdHeldigscGYR
         Pu389xQvNeJPAd7ZZJtMFXJwvkbu4Wy6omKyNC1gOEytuJVEmRa6M/R3aaa2nGdiE8iI
         6TG0EJkz8j02yHPcWJyEdQF+fpiQf1CehOQXOLsbNXYmfdVE/aa39VfeWlshnRXDSC/3
         hB9ROkJUd3tYNDBkdfa2+dtWTFuvpJO3d+G0xxciqAu5zhV4/7/ZI7VaGar4qg7UvwmS
         r/YNF0ksoR/9JFxygtbi6l2ElA8DC6OwMHz3EwQGA3XoeiDA9giSQDZUDwfYplHlmhrS
         aD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUnkuToil7LB0eSzW2VwZb/ZTASyz5r6XCwL0Ww2yScnTZbhqbJZsdiJ0QVZJkW2GXZJKQufQxjDSK@vger.kernel.org, AJvYcCWD1bGdta2AapDNRPt1wc++R48joC8hjaHRecEwHUhGaO0NfBFrFHRHolzJgW9NbfLwoeiqEGfOzo9/0LJf@vger.kernel.org, AJvYcCXjxYhQpfh9BIAl/fK81zrZzyBgAYNB/kC9Ca+pFFFb83STx3Yo4U2RopUSnU78ErYlodYV8dAqAx03@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ZBn5V0IaUkas39190N/iJI648cUuvloBf/U103Pc2HB5YLsV
	lPze1aRBzoCB6iIUKn1nkKdKuFaRhdTAPoqhyHPmlRqSFEW44Bcd
X-Gm-Gg: ASbGncsGiPUkDRj6A9+wqz2KLQ2m0f71d5inBqszFBrNEmu151l4ggFGRBoT4L/0VpZ
	IGGn9oC6i6MLj/ndvCgXTYyYGzaMqfgnL1NMOjYQrDT/K03x4eoaoIDbFik6tb4NT6sM6QzR+6I
	qxV9QesBB6k3tyu5HXNLIbGQcAxhwirYNGYn89z4GlWMJwUNGHvP/UCQtuS6jskrMcGRiN2WCCO
	v/knLo+vb1E7EeExeJR0g2unEbC0ojtNEtATC0Nb8t1goz1Hv+CBDVw5736m3kyf/CEcUv3fw5Q
	zRduiENZ+CmZc80KUfu7taywWR1YdLnr
X-Google-Smtp-Source: AGHT+IFqEbwHxaFeljzu0PfuAtp7udbO/8qKtjBqtLZxQcoPfau33bDY4QxP+vf7C1LVwNKwMMolgQ==
X-Received: by 2002:a05:6402:26d6:b0:5dc:81b3:5e1a with SMTP id 4fb4d7f45d1cf-5deadd7b9aamr10094012a12.7.1739523403214;
        Fri, 14 Feb 2025 00:56:43 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece271223sm2612848a12.59.2025.02.14.00.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:56:42 -0800 (PST)
Message-ID: <40a548db804c6c8eb72494de17bee6210b8a7a85.camel@gmail.com>
Subject: Re: [PATCH v11 0/3] riscv: rtc: sophgo: add rtc support for CV1800
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, inochiama@outlook.com, 
	linux-kernel@vger.kernel.org, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Fri, 14 Feb 2025 09:56:40 +0100
In-Reply-To: <BMXPR01MB24405F0CDCBDAF054888BB41FEFE2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
	 <BMXPR01MB24405F0CDCBDAF054888BB41FEFE2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
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

On Fri, 2025-02-14 at 08:31 +0800, Chen Wang wrote:
> First of all, thank you for re-picking up this orphan patchset.
>=20
> We recently created a mailing list for sophgo (sophgo@lists.linux.dev),=
=20
> and we would appreciate it if you send a copy of any sophgo-related=20
> patches to the mailist in the future.

Does it make sense to add the address to the MAINTAINERS file?
Or has a corresponding patch been already posted?

> You can see https://github.com/sophgo/linux/wiki=C2=A0for more details ab=
out=20
> this mailist, and we are keeping track of the status of upstreaming=20
> sophgo products through this wiki. We have updated the status of some of=
=20
> the patches you are working on, please help double check.

Looks good to me, thanks!

--=20
Alexander Sverdlin.


