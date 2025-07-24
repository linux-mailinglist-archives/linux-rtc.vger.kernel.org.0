Return-Path: <linux-rtc+bounces-4565-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC35B10283
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 09:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 794DC587E5A
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 07:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7706727144F;
	Thu, 24 Jul 2025 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5k8s8ej"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860F238C0A;
	Thu, 24 Jul 2025 07:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753343970; cv=none; b=Er5+9ve5m85GaC6DWtRwVuSJq4GVO1WYbvpW7g+Rngz9GoxsxbvZUyGFnrVNvy6xmPwZwLTXnARDEy+xPXlrR+RV7hCBiTAT2YOpfTxB9nrAoNyRJo22RcndzvaZ6ucs2JSavi34OFajYJl4u5VC8/WnToR+DYfkeU3PN9wVa3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753343970; c=relaxed/simple;
	bh=2sfm/hHQDAv7ek2SA9VP2HbWZvRGZDzU9Rn9vZgZh/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHL7SwW11gyt/VF1YEkoTkjYBacO9v7eyAvwuIm/8u/kpgeuPS5jNxDnjHTIOwGxFq4sp5+3mOT4GAx6WlNJziTSH6CBdgzQMS0WnGxcmNJEQ8b+ySUAmQcV+gM4l4S0ZjerQcn9yX+cjDvoEBcm6rdTe5CNzuQFX+/d5kw5QtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5k8s8ej; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F08EC4CEF6;
	Thu, 24 Jul 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753343969;
	bh=2sfm/hHQDAv7ek2SA9VP2HbWZvRGZDzU9Rn9vZgZh/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5k8s8ej1IMlqen1tEoYHXBV+DQZuvo7evitXpUOEh4NoSM8WxbVHfGlkP7NhY/V7
	 fiO4N6T4JpMak8VYK1PfZhitjqE/tl3bh7de3pRfWKKipHtesSiCPCWhRSAg3E6bNU
	 YCWYyxqyVZhq1Udhv+02PVX/OcUtZYcekM4r1sP9yb9zsbs51noSpzgIatXMRF2MOl
	 XXoxEZRcwmm9kP8Ur0dOh3TPk516gufwWmaM2quJM2j0LkScKuBBT4fxEu59HBYLK/
	 PiIkE5Rk+bh1h6u1GPZ4EK0WONhPpmYj+Qf6ByhKZYNewvpJN1Yn+bOTtl/U4AECI3
	 razYpVeLYPGsg==
Date: Thu, 24 Jul 2025 09:59:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubhi Garg <shgarg@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
Message-ID: <20250724-peridot-chachalaca-of-progress-a9f2ee@kuoka>
References: <20250723130343.2861866-1-shgarg@nvidia.com>
 <20250723130343.2861866-2-shgarg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723130343.2861866-2-shgarg@nvidia.com>

On Wed, Jul 23, 2025 at 01:03:40PM +0000, Shubhi Garg wrote:
> +description:
> +  NVIDIA VRS (Voltage Regulator Specification) RTC provides 32kHz RTC clock
> +  support with backup battery for system timing. It provides alarm functionality
> +  to wake system from suspend and shutdown state. The device also acts as an
> +  interrupt controller for managing interrupts from the VRS.
> +
> +properties:
> +  compatible:
> +    const: nvidia,vrs10-rtc

Nothing improved. You never replied to comments and then replaced one
redundant word into other redundant word.

Respond to review or implement it fully, not partially.

Or add COMPLETE bindings, not partial ones. See writing bindings doc.

Best regards,
Krzysztof


