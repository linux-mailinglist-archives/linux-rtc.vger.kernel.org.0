Return-Path: <linux-rtc+bounces-3794-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AD5A7C9A5
	for <lists+linux-rtc@lfdr.de>; Sat,  5 Apr 2025 16:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D01C16ED45
	for <lists+linux-rtc@lfdr.de>; Sat,  5 Apr 2025 14:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B621F3BB7;
	Sat,  5 Apr 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dl0xft0C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCBF1EEA5F
	for <linux-rtc@vger.kernel.org>; Sat,  5 Apr 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863352; cv=none; b=pESHqJ3Fg1bY6b939hDJsRLrQt5YNhj4U/iuw8ImgB332XmjULwV5jK1CDRwEsGW/0kneePEEKpfDfO9AaIoK872L+dK9ke7/BOgCiK3e53WWSWr3iU0z3dRLcmkGVg0ZFAWljKAmJaSuFpjpHTCf8TquHv96H860u/XENg9thc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863352; c=relaxed/simple;
	bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fNujs0BCz99COMaOQF4nf0UCQPfjd/DEEUZ15CO14TXtsN7+qhf2Qa+h3/B7Z9lHJT64d2agAu8Tsnqd2yLTnxUjagWCdypej52rEgmOTWrQv1uZj/XfVyXf7asqkjyOmnqy8S0NlX5c7FtFYslgK9V3QFOknct3wBq91b+JK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dl0xft0C; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1661087f8f.1
        for <linux-rtc@vger.kernel.org>; Sat, 05 Apr 2025 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743863349; x=1744468149; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=Dl0xft0C1X6gds1VaxF4D5yQc5Q88d18FDmfNNaoHDAeEbBFisYX9phxnpr1nP/Gxj
         8QEoy+ztXWcQ9J2mbRIfa4u8GkQf0qP+xsm7bfceb5+HGS6QG8SuJ18Bc8VXUvaQJiKY
         s6yC/lmUCLL8sndZj7Ts/n3mOClo8tclwSL6dUQubk2xc5Qpt61Xs0C9mzzhIm9VNmhA
         0o4FMCDxMN8x094tEbzL4bQP6/fLF65CYZ76CUVLCF/HtfURT0eWs5fNCKBTKPFRzUbM
         KFCF0tWTOKc01yLQVVmzaGoK5NLzZfLS/Jzfs5iUk9VHJf8a7SF0h19/6yx1d8tLwrHO
         Lcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863349; x=1744468149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GiHxnNFMXpNIIyTnynX7IxDP/p9NCTJMguIsJZ7Y6h0=;
        b=dahGMovTK5qG0YPYZUOGXUsORzFy36gpR/ZsIP8Itq3ZdDvODj2L8pb+ihn43UnGgh
         2IwGeYqPX12rgNkgYCYxWlvLlZFdyW6svfofDrTGEY/Aso6GssrQWc5NCUSq95v5Ac73
         SiRyxuRqdgtiJD4qAdhxrtY8G6mofnYCSCWwPwuIK9nZdqDJdSOLz4Hxh9tzkpLNbi0y
         6pvodYIK2iahk6xTR7IYBz7SEfIHlR7Hyqzr9JsLW61y3ca4LDuHXXdAmGRObJg4nCVr
         kZflvuURn17rwNJo+I7JANda6YJDK90zxDdzLqwQFiT0I/WM1Yla3uwdmOpT/G9ybrvE
         dLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxr8wb0ZM2p+UwTvjtx3pazzugQiitOh6y1BnzRCIg7r3QuCwTnRue+48Ixivn7N3uguX6Qd659iQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/48KujQiSMFlhVE9lExF8qrLO4WyoWH8BcDeq3B7RsL7uahg
	V4fyOzw2L5+1dZNXXgfUxutKLQGJChgZdQLxq5w8/k1JekrFXJdzOvNjCGvWYS8=
X-Gm-Gg: ASbGncuzqGyexhmkjQPBJ0+ph+a+DMSguZzN74lU/y4QNeAfAWUrqXp6iVPYclU9zUq
	84iVWjEKyEa4KGqPMLjE4Q+ZGp7V+KAmUm5GtJs6cpEs1L0xv48KMAdzQwdbvdIbgIbgITKGc80
	xrWNVjk13u8mO+wkONQv6LFlGTB/cV+hY1yTJ1AIxenelSAR1RYfK2vRM2ZxgfD/Izaik9k/0rB
	yzrzaKHBabSGv7Sekqh3Bmz5Cj0ghYTph7Vqu/zZ3wdpVm1vZZTrU4nFjFy8YhJZL17PDJuSFCP
	9vGeXKF2SGj33jBBJWgSDWoVjmXejCG8IX9VzVVxYOTd88rq
X-Google-Smtp-Source: AGHT+IG+Z0ir3xm5RCrAq1SN4ZDlwjVRgFNS1Hr6WM6JjZY4zAku9AfXOB4reUpFaHMAVqmVf3D7Rw==
X-Received: by 2002:a5d:6d8a:0:b0:39a:cc34:2f9b with SMTP id ffacd0b85a97d-39d6fc291b3mr2358345f8f.16.1743863348783;
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d63csm7230344f8f.69.2025.04.05.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:29:08 -0700 (PDT)
Message-ID: <73d99b656c405a19f75633796b696cc1aae71b90.camel@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 15:29:06 +0100
In-Reply-To: <20250404093035.GD43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250404093035.GD43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 10:30 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
>=20
> When you resubmit these, please note that MFD subjects take the form:
>=20
> =C2=A0 mfd: <file>: Succinct change description starting with an uppercas=
e char

I've followed your suggestion regarding the prefix when patches touch just =
one
file, but for patches that touch multiple files, I've kept the 'mfd: sec:'
prefix, e.g. in patch 18.

Hope that's OK.


Cheers,
Andre'


