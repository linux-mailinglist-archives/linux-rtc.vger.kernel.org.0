Return-Path: <linux-rtc+bounces-4302-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB896ADAEE1
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Jun 2025 13:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58FA816A86C
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Jun 2025 11:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D592E6D0B;
	Mon, 16 Jun 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDLk7ZVs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2719F424
	for <linux-rtc@vger.kernel.org>; Mon, 16 Jun 2025 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074187; cv=none; b=jpKOslqpi0chhdN5owrGNlorUZ8yW9R7vcMoSjGaPF6Hm/gPx6KydBcg2/Gt8hIw/2hO45wfS4dcyU7lmb9hrsZp/fh9U8AsvY3N2bo/Rv7tmScNags8QA8hk0+5w150LRzGZE9Vl51vDtnN+KBOyNav/i55fXcStZZEhPfU95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074187; c=relaxed/simple;
	bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=avw5SllRiP3+Z00arsoBO6Z+A5qwKomJwUAt61ArehG5KlFndM098ou2CeqyRqiaFipdR7jPVNGqTVhKwIaWY5NPLan/bfQtWgiKIOqCblHAdYF00XDyKDLAw1Ntjp8GNUlP4lkvr7siS5yJsbCO9xZX8Hw8BZ/aPvX1dcXdmFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDLk7ZVs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2943494f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 16 Jun 2025 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074184; x=1750678984; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
        b=ZDLk7ZVsuWv8EGpzNkH5kje+h6ZdTDlu8gF6ua76rta/nR/53VaidGfKmHOSKFcwZw
         iBBs6mseFtk8nQoODYNYkkbDhKLCYKH9lyJitZF+KlzYBWt/Y+5vOqi9b+ZduNzYtHbU
         fSiPkVtkwyWw7e0vpvzBLnf5EfhpDKtWcB4Vudi00BrS9fx7aPu52QZ+TdTFMSTJpGx6
         mLHeDTNS4hDPPfzlhuFCShJEZspD2YJzXvIwy8HimxUApvxFfHo216Rsttx6PXNxU8/o
         igkZuMxu+hFmoEAh7vqQI8Vg5qnkP5CwuX67lTDcZkuCZc3SbpynML+pq8hWdiTalN+W
         EeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074184; x=1750678984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
        b=fwmfkW6uG1B5sGcVdzQzUsZ1Zd8VKiRjqVv6NniFMTMapETdWIHCMWo09FNi2SaoLS
         DkuqMpZGs4iL4hy4In4wSLY848IKljNOz6iN1e2LPa+A+Y9flf6Tsu7odJIwmZkajhVJ
         tYVKp1ITRSd6mfZo/GWOh+ewPV/sqZCOPaas9weFYhPUFiHgOdJuboabXbXE6nV8YB0d
         Ul4Mtq+sgFh7neirmb5gXP8uQvXBFAJz81TaMbPWH5gw31xzjVMZ/vvE2pqVba7FTYey
         TH0vr84PlTidlges8bh0PKllss0Js7wARI3b6Ke1w/NqmOzEAFhOMZAMzmJuHt4o9SUo
         BpPg==
X-Forwarded-Encrypted: i=1; AJvYcCUoPWDyRDPQCiywN+cGCsUpLpNLCH+kc8C7aBJD34ypB3FAZbhpyXKmPDdKErSd6fBFlFdmdEWnrpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx09t3Jr5vTQyY5N3nYySow7WCgUjlOXFmAAnZXgjLbD7QxZD/
	0yMQMm+t5k+B6dn0NcHxNSnevQt4MFkcPlqnVvdDB2CVgSoC/RiOXQ5DWEH/TA1NGv0=
X-Gm-Gg: ASbGncvazRfd1GDDdj4FRzqYrlr68S48DQOBgh6H3hTvZeS95Jf8YEUhis1ymmVNUOF
	dkGmdK/Yz5sd28wbsE3eNwfS9dZ50mo5KVw9D2Oh77pcDbuEb0qrUXptYACQOC0TpPPkong5R5a
	ECOTdvqPACROMLvssWWUlOtltXy7w30bIWCG6qQLDVLCdegaV8NROxVI/DdSsexxyF4Oi0dVkGl
	WdgRINqyBcAz2m0zQVKskFiFfe9zNGgIQiQDxCuMquxCoewf98BY3afUKgo1svlglcf7LgARrd2
	D33UJCf7Eg1EZYV7hyUVmZg3EIPmQBILt/ZQtyZJWcKUMbhRhod9N7UrBNx49L8y3Hk=
X-Google-Smtp-Source: AGHT+IGzR3ZuLPqrDClmDT14/rcbBa024Df4uvC1J4VfbxZQZgOlZKKu8R1O8lRTFylZ0ymEYgXL0w==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2b75:56b3 with SMTP id ffacd0b85a97d-3a57237c7femr7023655f8f.24.1750074183744;
        Mon, 16 Jun 2025 04:43:03 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm10962182f8f.94.2025.06.16.04.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:43:03 -0700 (PDT)
Message-ID: <85513da45f564347185d1f5a6bdac242df022071.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 16 Jun 2025 12:43:02 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this one be merged please?


Cheers,
Andre'

