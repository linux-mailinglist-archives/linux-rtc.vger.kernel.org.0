Return-Path: <linux-rtc+bounces-3631-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C121DA713F3
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 10:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DF421896721
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Mar 2025 09:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6E71A0B08;
	Wed, 26 Mar 2025 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zqjeVpyr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5BC1A9B49
	for <linux-rtc@vger.kernel.org>; Wed, 26 Mar 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982171; cv=none; b=uvauQoZ4Kh9Ny71YPX8G7PSk/5qgciIxJ6s/8T54mxpKhyUYEbCplWsKd9tYwdmL8MikJGV2ymajmGqDbMukz3T77k+rLgTyAdN4wOxyBJfUTISFg2a1q18RaL7vtLVf3wZpmqYGW/H3sU5rAWi5zmRdSupFRO0lO27l6ExpzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982171; c=relaxed/simple;
	bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SFGcBCG2m9xKrlwIB4mmDIkL+ZQzcIwK1z1uXqqGdX1SX10j68zuwr/JZnfRnwyyCg9ekR0X4UVBMKxqHzkpz9zoYEPHHdIo19JARYQCEx/a5jpn6AJ3Pvhe5M3/qkH0eM57/SooussaPwodA3OkSC5IECOnpU1hkpZXAxTicY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zqjeVpyr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390f5f48eafso3630730f8f.0
        for <linux-rtc@vger.kernel.org>; Wed, 26 Mar 2025 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742982167; x=1743586967; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
        b=zqjeVpyrhgQ/NXGty1PgUN3b8mwx56PVRJzxDHl4Ock4WqFoi73/XTjZ0yMA2yGROM
         nJHE7xet4YKfMUS4U1/t8DktJHik+cttkZ+x3CZzDXWd2wzIB/JlvsvevgJMj6NMoCrV
         GVw1nag1t9U5b6r2H18ZqB3HquVxcwr6sO3qS0gdw3kL+Vd/4v0fR23qVSZERRq/hjDr
         YFMsw4ULzqT4HhK/pRkwhtPYJW881jF+5yaeABRjneatqdKAq/TVWfSYTCgfDL7TaI0i
         2l0uPOn+yEea31cxsVGhvUoO2GhphEGl9wqrQ07X5p+fTdiJxmjar+h3MHwXGb2S76+C
         nfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982167; x=1743586967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oK9w0PHHeYSQoiTSBw6ii01fBfUomipWqhc0pGmOdEs=;
        b=IdAGkJYi+Iu9T8YoyHsuQynuxWUSniJeDMGYJvehZIWWI1NLQFXg4Ss0jWCQI7vEHo
         ylB+5J5cheYoqQ+zbtJ8MyIM97Tm39hQw+oQFwRbqZ1hubqiVnJm8fwBqgnjHwC8VUQY
         +N8FcysrzQCuPOyTsHa3EDpWCQR8y6GT50XAfA2CQ02SAK7RVaICpFngPPhRakQT/ayQ
         2Yye1UPBNRFU7veOonZov400AfHbQwZDu6QN4Lw4mrum9Y6l4wKYUKMt7qW85WgOwanP
         QbNs6kqypf4nR4yDaL1T/xXX7kdrLcr4jEpps8mUFHOlcMqXqfUd/9ncMfqyhS7I8rfP
         uQpA==
X-Forwarded-Encrypted: i=1; AJvYcCW7ORq6Ls4wQYgX92enmB03LFexj0yi2N09+55xr0x21/1fS9TX5KGCxx4kKcNG+I8SsSc2LfkxIP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQB15EqOK3aFZkSkPT7JnS75zHRDKh7AwwksBc2hT8gJNBoE05
	AA8wVw9o+XdN1Qm3jkcz/SpMzfDx6U09K3ZSt3bxLvROHz87LYqVotVUfBzYOr8=
X-Gm-Gg: ASbGncs0IwkLvx93Leek01jD3s7FYLS7I8G4SHnYYKE5UzA9FmZwdcQR/8wHoDzbJX6
	CluSwM7F0ngJ6mj3tgo1qV3xusOGpgVnR3IWAXA0t9zoI0hfiio5Ebclw30D9akpElVs+FIhOQw
	UhHcas+vPIp3noz7lTtsScZ+PdtEv+tvNl59Qz+jqfdOXpdpWCX/mCKp6x5XF48UuyKe1jdhGCi
	7POR/5HMOxDmiDPofWoxq9pg01/cdK1Edti2cNOrEwS73r18uxIO5yLyFqcjTRBGMtARhCpO8ah
	ox89AJNX3LvPeyj/YT3xBr8iUSMrQ7PQxlGYPghjTlOU4R6zzA==
X-Google-Smtp-Source: AGHT+IFPYFB/K6M208ce6TYKpgzYD2gbxBVrga6S1jcpfDNM/sLdTcLlHMBJoMx/mLpGmNEqFLCYBQ==
X-Received: by 2002:a5d:64a2:0:b0:391:2c0c:1270 with SMTP id ffacd0b85a97d-3997f8ed9d4mr17888571f8f.1.1742982166969;
        Wed, 26 Mar 2025 02:42:46 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995778sm16406564f8f.11.2025.03.26.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:42:45 -0700 (PDT)
Message-ID: <53e7fd763da3748dbc7a5205b4f93cdf9476aded.camel@linaro.org>
Subject: Re: [PATCH 15/34] mfd: sec: use dev_err_probe() where appropriate
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
Date: Wed, 26 Mar 2025 09:42:44 +0000
In-Reply-To: <e3dee29a-dcee-40b5-8bf4-22a6a8a7993a@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-15-d08943702707@linaro.org>
	 <e3dee29a-dcee-40b5-8bf4-22a6a8a7993a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-03-26 at 08:24 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > dev_err_probe() exists to simplify code and harmonise error messages,
> > there's no reason not to use it here.
> >=20
> > While at it, harmonise some error messages.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Maybe such cleanups should be before you start moving the code and
> splitting modules into i2c/core/acpm.

Sure, I can re-order them. I didn't want the new PMIC to depend on
all that cleanup, as I believe that had been previous feedback (but
maybe I misremember :-), and also to avoid the new PMIC being blocked
on potentially contentious earlier cleanup patches, if any.


> Anyway:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!
Andre'


