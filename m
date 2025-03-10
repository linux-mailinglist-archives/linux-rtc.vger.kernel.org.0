Return-Path: <linux-rtc+bounces-3447-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A48A58F28
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 10:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E5363A8323
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 09:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528B92248AF;
	Mon, 10 Mar 2025 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5fp4AOD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C021422E;
	Mon, 10 Mar 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597993; cv=none; b=AMZ26q7IHnOR5fZjq6kQ2mmnd5WU2/uoO9da88UQezIAGqn1fDTOU8ds83IFm/0Pk587+5qOuzYBeS29KKL5in8nk0zoern+pid2pYvHsW/4D6mYFDMUMUeZALtwXZqdKzpIErfB/1uxPFXcZd3QL6aEI5IpvTDY2SvNgvWCXeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597993; c=relaxed/simple;
	bh=0EiRl5NBHNWBwhI6VkgK0vK/Hx4plkeswdLXn0bKrbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSVz4XR2sR6SAv8lQU/N7eojaqQWteTXyUnmIKfZWItPtacH2ZPUHD9H3StjT1OPtDMzxNZ75Qn5mvzUxw4D0ADlRSXKC/vQhrcqzHPwJBNvPsAvBDQCs4AxBlyErE9o3InTf1Z30wEKnVb+xKNlFMA9qbqVgnpNUYDEaTnGWK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5fp4AOD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EFAC4CEE5;
	Mon, 10 Mar 2025 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741597992;
	bh=0EiRl5NBHNWBwhI6VkgK0vK/Hx4plkeswdLXn0bKrbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5fp4AODzOfomzGXKP7VeFLJwIeUY6nZu3Mzqr/Zs3spJRTKUVgXP6Fhc/JohowEX
	 48vJDH+PVobzdNvt6R9sQomKGCfuNYwMqiq/a0pXcbz84uoRtio4kF2EqKjV7hKtyz
	 qJYm+QVXqDrar4bUGKKXzCsYEpyVW62lJYrVB54h+D0f8gf4gUUbyhYeVNnVRCV4c6
	 nMQ1awcWjyoH7HCk4hj9sD7LECgb2PF+0GZVztQQuX9rbRBZdMWaaGAihr3nZx8Okw
	 XJWwmU6aVhB2yD9EMLAK3juKx+7V9xKCOL2mnc6qUtleR4VOUAzYO0WTyR+RdJ1L84
	 kqwh8q6VLUJNg==
Date: Mon, 10 Mar 2025 10:13:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
Message-ID: <20250310-economic-overjoyed-wallaby-8e2ff6@krzk-bin>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250309202629.3516822-2-alexander.sverdlin@gmail.com>

On Sun, Mar 09, 2025 at 09:26:23PM +0100, Alexander Sverdlin wrote:
> From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> 
> Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> called RTC, but contains control registers of other HW blocks in its
> address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v13:
> - Moved bindings from MFD into SOC subsystem

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


