Return-Path: <linux-rtc+bounces-4448-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BB2AFF98E
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 08:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CA6416E000
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 06:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAF5288C27;
	Thu, 10 Jul 2025 06:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkU2IP7u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9E2882B9
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 06:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752128010; cv=none; b=HxNpeVbemW+WKe6SNSh3M9U0I8N8t4VG3WGQVWLE9fVXXmQ3abcoe12KifQCrWxj4FONkvMHIAEyW96bUsqfD6tHYHqA1ul1nDwlJl7h65U62qlDAyfjfymovaT1e1cYyelgmRyS2l+QLk3XOqJfwZgAJwi9sy4G9hpu8QO8FwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752128010; c=relaxed/simple;
	bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S6+NcuwxcrztDx2hSfeWbCgQjtGDR8gmObjJbxO9VhAKBkqfvJOp0s1j2hugsInCyJ4acy8ec/yZGImxd8IyhJMKblelFJhqDQBJUBuNgyg3Q18pTtokw13Suay2FLaJkiMJwljnge8WQ8GBHOyJgMP1ylh0n0Yk42HfzC1ltTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkU2IP7u; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so5266125e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 09 Jul 2025 23:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752128007; x=1752732807; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
        b=zkU2IP7ujYqTyGGOEW3gmH5SnilvbRve8qYvn3zZuWyRFLoCp5r16oqHfTezj9RUKv
         eaBQHBxucWJ691nq6t1XjB618YgEzZgsb3R3GgBmoI0VpHQwL8JY3coW3F5Td43x0NDs
         LkZplLhz4oDR9SyW0DSMmEN8ShddZ+cSR1E49p8tT2p3oPpEloCx+AUYxR3wFmDKNqhJ
         9VmSzjIppD2gIZ1LHomX+CyTD1Ug7kntwFqN+DP1J4W5nghXPcx8a5wNPryWoBbfJ/oo
         TQGdLOtz3y0TtkF9eT7Tm9V2dQjol6TF02lOrzH5NYVT737tEDq/bNIs/v/KSJc4fZk9
         /QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752128007; x=1752732807;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8z/J1LwddlPoVhpvDuP4Jjqir3C1G5kWxc1+n6Juhwc=;
        b=vmP6Jmu/B4Zwbn7MAohK6EiNO//TABCLAdmUmqSNfvD33pMvzPVtzLEh07Cx5tIhdl
         J9muG0rj0pHfoLbEIvsFhAf1r+WifNPxZRb55pf+/PqSqq97VAbn4ZH4BGcR/aKZ06F6
         5mpKhyzo8VK2gX+xrTgaAGhRwE+tcQA9OCD9N8JbSna3P6gCm3mz75yaHhpt4KxRHQAA
         cjJufQH+kXN+Dr3Ye9PuhNrGCrJUvzptuQjul9l2kBU4Sl7l9ziMh4aVCBBTX0PGjz6v
         BFmoKt4TKxRo4kqCvamFGkZQ+0QItSVXHVYdS/T9nvSUd87Qh7NNZGkLI4AWhA+6P0zk
         HE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/HOJcyuxvr/ICf0vyurD5rL6JC9rJo8+uxEMoWotsSVjC+w3vVF5MhnTZHe1RoSGABbfLD/P+hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvZgZnL74u4cbyF7d0YVrtF3pRh4nZNVtXWAiIMp7/vWVV9GGH
	uiaXcKAF7fksKLHOwvL1kCKdXGzSFLY7aTGH2F3deAPF9mlsYhfj/YVFDfWNm6xkv1A=
X-Gm-Gg: ASbGncs3BmFft88tcu5BgpSZxVxyIM08xWgG3FIGFTUb2JFbO/ga/c7L77pw/kxC1+W
	AQiYuMCP3G1IOBRR4MV0JD7idHI+6SdU8svkC0zG7pKZg3v8cq8nGw5Nhj/b5oUcloUk9650cmV
	dXudxhczVhLf7Ve6NrmbpsLODWm52Bkr6YEbYjwnyzKKhFx1wotr0026Kles3xEUTsJGRG7LWu9
	a6yZl8/LOIuhtQ+6KIFBIhH57BwVqEVir/2YsoTwdrqLBmMRInZ/R1oC3XR2RIuBFPjrHylCcCP
	juyf/aq36QHzYlhU1uhbsKFhQ/WOLZsHbtaU7Hl88OCxwLXvCtjMJ3GddN04LsYqMg==
X-Google-Smtp-Source: AGHT+IHg4xHnynLCiIdYwfhLH1O40xn1jbcOOUbuZ4D3/9/bt4jhqFWxA6m1cGXDr1jP9UbGzQIkuQ==
X-Received: by 2002:a05:600d:7:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-454db8d8cd6mr16068235e9.15.1752128006691;
        Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm8854885e9.12.2025.07.09.23.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:13:26 -0700 (PDT)
Message-ID: <176473e3012018e7c6e584314fc68679ad44197c.camel@linaro.org>
Subject: Re: [PATCH v4 24/32] clk: s2mps11: add support for S2MPG10 PMIC
 clock
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
	linux-rtc@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Thu, 10 Jul 2025 07:13:24 +0100
In-Reply-To: <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
> existing PMIC clocks supported by this driver.
>=20
> S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this patch be merged please?

Cheers,
Andre'

