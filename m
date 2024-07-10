Return-Path: <linux-rtc+bounces-1466-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEF92D4CD
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 17:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7BA6283F62
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2024 15:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BBA1940B3;
	Wed, 10 Jul 2024 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XqnjmAhV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064525F876;
	Wed, 10 Jul 2024 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720624596; cv=none; b=do+ywkLlGKuLfaLIlXJzPmBHGBYr5PFad8PaSNbbSX2IQ3nkk0VZ3VujN1+OEx3EOFGPxwVieFemo4o+epvs7p0Nh5q9xL5OIwu1bccu08D0CAynq8wbfsu5dFgOfSqks20QVXBtBH4MWEVgbb6EdBIiC/URN/zCdau3uXw9aZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720624596; c=relaxed/simple;
	bh=AYv6yPEPs+Fc8HE3p2w3GLepnn0qXgtWjShco6gHbT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ris5+/UsWa/gbZ0VHjPejuD3wGoGrdEIHadhRrQL16048eo1VO+mv27m/Y/4QfZe6iRmb78lcTvKi/PfiMG6P/kZwg92O7GZxpuYaGXEC3V/Cy0ucxIRmFAOb6uZ1WJMPHU0Dkg1F00SMVpKzGT8lTQrJIe7/f8IFN5UI+fEER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XqnjmAhV; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEAC71C0004;
	Wed, 10 Jul 2024 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720624583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qbzKLd7ErNBgkbYzecOVb1namw7uD3ODB1goMPPdBkM=;
	b=XqnjmAhVOuJsiBws3R+w+psrQpNgCAdH+iSYZDUagZ+SAu6rZKt6jQtkwDFDoJNEMTdAGX
	vCdWn2og/C/5eDOVYsxTRpC7d+wHRM+Q6RdI/TuaHNzSP02/8NWg+Bgm2jakSQ916rTEb+
	yGrZCBll5elU5JByE4C4u3uj8lQJ0zCWxwKXg8juJ8ZqzTML2bJV1IAz0TX95+qlMK4Rd1
	q4vW/Qk2ZuEpZM9bxoWCU77NVHXZrzLpsP2GmBsi4UD3rQjnoL+t+BxM178Zj4IDaB1WC7
	9caRRFE5hkYDUNf1gU/zohoRVpFIrERn4hSgdMSX1TpWkLxPIpWhp39kXruALQ==
Date: Wed, 10 Jul 2024 17:16:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] rtc: stm32: introduce new st,stm32mp25-rtc
 compatible
Message-ID: <172062457006.735991.3860839372097638119.b4-ty@bootlin.com>
References: <20240708153434.416287-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708153434.416287-1-valentin.caron@foss.st.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 08 Jul 2024 17:34:32 +0200, Valentin Caron wrote:
> Introduce new st,stm32mp25-rtc compatible. It is based on st,stm32mp1-rtc.
> 
> Difference is that stm32mp25 SoC implements a triple protection on RTC
> registers:
> - Secure bit based protection
> - Privileged context based protection
> - Compartment ID filtering based protection
> This driver will now check theses configurations before probing to avoid
> exceptions and fake reads on register.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: rtc: stm32: introduce new st,stm32mp25-rtc compatible
      https://git.kernel.org/abelloni/c/1746a61a0248
[2/2] rtc: stm32: add new st,stm32mp25-rtc compatible and check RIF configuration
      https://git.kernel.org/abelloni/c/efa9c5be2cae

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

