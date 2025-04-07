Return-Path: <linux-rtc+bounces-3811-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C3A7D9C2
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 11:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC6F5188C8E5
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 09:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C082C22A7F4;
	Mon,  7 Apr 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTZvzowo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C941AA1EC
	for <linux-rtc@vger.kernel.org>; Mon,  7 Apr 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018500; cv=none; b=CR9vrSjCPu/Dq/Moy7aqk5FirkT2rNpIKzzeLbwhlXgMipSL7fG+TyZ2QjrXAM8hqWFeEZOUIaD67WUiFzxm3uHtyp/yGkg8NNu1mjsv6xFI4Wgeu3VElm6xFIBEwmrmf6/OTpkzPzbUw3vz2LXFFWcKrFKP+dxEXMnddMhdnYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018500; c=relaxed/simple;
	bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P0R6O3LOSfHX1YW6ycMjaRZLsIWOdzN6xYOf3acE8lndo7+xIpr2N7l8MftKI4U0JcQhyzZIZd+Ds9hmskco0vdbYxLbV9r5ez9tdVx+KAg3OVb/3C8zMZ3D5h367fF/JGYz7Qff1bQnpq0v6DjxwiP5tgpKjpQ5QEdKhigJ6c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTZvzowo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3240251f8f.3
        for <linux-rtc@vger.kernel.org>; Mon, 07 Apr 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744018497; x=1744623297; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=uTZvzowoocuBhurdncvrklh8cm6VOJJcEIQSRLbT+JGtoypeC6dMvlfj0mc8wZU7I5
         GyrRjkKf2AE/n8NApqIRK5yf5sUDv6SkkdUQk5Y1v3JAdo4/vUs0MpVkdQOaBEbrCvno
         9xwcYUmjMDtS3xRbrMK3s6cOK03cLKKW5aK+EpFFk/Ds5xsPLUCQc98cH9poXIQMrzz5
         BZFhHInzrACnCEhR68cMq5z8Jf8kDYV333FTnQUjigevbuBS3JARVdAfD2WSx+2AF+89
         Vid59EjqbCNvhYtEByIRuyLU9p/dim9hoQjOWRXYIjifXG19IKdXNvRHa4+t4k7QRloZ
         Apdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018497; x=1744623297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=J7VViiqJCGZexwCv2wHa4mYS/uDnotFlkYKQ+RQWg6JnBqjl9WnG2x2qBvTfoZBibO
         IgQaJ4yWwezB9fmjvSAXrgd9sQKSLef2BM4JQz0VoENIK0qVDPryITsc0CpCduoQOGuH
         0T61Sm3OtpHUW6TVsMqOshdd6jTJGHnYL4eUsB14tHbc9+2kkjCP9LLM5VLbV294R0+S
         q1GmzLjJGn9bKh2/H3pIN7irseNNonjIi1x/RCN1tL2XUGLqNU0j07T62+aI2MjLRj+x
         FO8gc23olx2+3nh8TqWx6KJHf3MxiO66qGYKG0bycC4iU7fiB8hmAi7vMv4u8GYL7oJR
         QljA==
X-Forwarded-Encrypted: i=1; AJvYcCUGsj1YpHf1oSgG90jQsl5sQ3xGJjYQJej4Csh4X3xkI2LH1gdBBRduZTV7Ckw1WQbCAlBPanSn6JM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYhxRWRED1kyhdOQmmfA8uQTacChvXk5VD1oZFWYLs8nahMjdu
	zycZVipxKEX0mzx1BPKCbNzGe671BLRnvgqG0woDK5kFS9sFz1kVNAHYPav8+Vs=
X-Gm-Gg: ASbGncvk5Qt480onoXcabvJeVY2QVtiBp6R5DQL/9g+qToZrsce5xwLeQDIM1dF/UHH
	Y5eUIprtJZcKmK0sHe9TtcdmALbvb+F3Gdt8lhkvUvYAIpVVh81mywU4xIh6rgG0VX0E+0EDSSC
	CKdMA0YI94EmgLktl+EH0Xx6tcahAeH3j/6UxDXNDrugc+uYnfjOAKh+OMH2DuiXR3BjSeH0TKx
	Q0yT/mJZ4nByznKzLOd51kuH4azwfp7FggjtEfCt7wenRDwjTD3PZ/hpmmA05a1PMl22JSXMPcp
	k5uoxiKlQd5yd0QU3MkrNUQ0Qj6lykmnnPEeJzVv+IYm0kH7
X-Google-Smtp-Source: AGHT+IEK2ylsj8A3zv5KP41r85GTG06Mj0FN2K9Pnsar54qT+bII0+ur9gb54xnBI0cqR8Dv4CuOpw==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr9835262f8f.29.1744018497031;
        Mon, 07 Apr 2025 02:34:57 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eda4662a0sm85615765e9.36.2025.04.07.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:34:56 -0700 (PDT)
Message-ID: <305582d4a9c0fc8f34f997a697081409dd2df273.camel@linaro.org>
Subject: Re: [PATCH v3 27/32] rtc: s5m: add support for S2MPG10 RTC
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
Date: Mon, 07 Apr 2025 10:34:51 +0100
In-Reply-To: <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-27-b542b3505e68@linaro.org>
	 <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-04-06 at 20:33 +0200, Krzysztof Kozlowski wrote:
> You just sorted the MFD headers in other patch, but here you break the
> sorting.
>=20
> For me patches resorting the addresses (as a separate patch) is churn,
> but sure. If you do this however, it means you really believe that it is
> worth to sort them, so you must keep that standard for all your further
> patches in that series.

Definitely. Not sure how that happened :-(

>=20
> Rest is fine, so with this fixed:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof!

Cheers,
Andre'


