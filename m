Return-Path: <linux-rtc+bounces-4700-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0132B270BB
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 23:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BEF6AA5792
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Aug 2025 21:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E51273810;
	Thu, 14 Aug 2025 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+rQbFKV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FC2550D8;
	Thu, 14 Aug 2025 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755206370; cv=none; b=VHGq1lluj5waUAcI2Sf4K4bi5UNNpnsracZBuoGhRB+kKCqIAXvK9rNR3CrqM0fD6X17fbhr9vSo4WObcERbH6x8J7KC/mHwxx5Qm7PoihQ4xX6mmhw4jUTOqwt8rl8R6+ZTDRMnhANAepePD5eB9oNSf4kQIinNZPERs1TlpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755206370; c=relaxed/simple;
	bh=Rp5HHClNCs4aOkUL7sssHUYQCKwZAsLIt4TkTxZMYCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsH5y2wfaz7w2jW90hB+Lv4HAEvKcG8TQEKtoNK/+8IRjN5lUikpECf+VVhFpww14GiC8sLl5R2Z51mF2rOFcdXHIenmoS0udRjsKGb0bYY2xter0wfjxgDPpxlik63hY3totGdo7QJdwFmyGvyFu0zj6R9m/9u3QTIOzefHZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+rQbFKV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942BEC4CEED;
	Thu, 14 Aug 2025 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755206369;
	bh=Rp5HHClNCs4aOkUL7sssHUYQCKwZAsLIt4TkTxZMYCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+rQbFKVXCy3Sn8DBpesxLjl6NFd1ScybynS/VPY7zsautaMPzoRADvFhi9FNFQJY
	 TajrqgMT0GWizoOGGVulu1WBdho5MadPbUiaGFxUgn1A07BooZCYtZpoB6jo4IioYm
	 zaPWxltuzg9r9dsujVY0P7Z3V5UQGO6h4PAd0drh9OGiZh+Zu9wxlcJQe/LhF0wBeG
	 58pgSRfIKRs4U48cEwkfqqNLdVNz9oy2gTjrINuyiiluHIJiTjBcwIF0T3+LcF0pH+
	 eEDx9sZg1+uchZpXOqP0yxPOWPmxdsLXx3X58wQq/V62JB4eAAhGgUA8tpsDe8lwif
	 12xBuCBuPxd+Q==
Date: Thu, 14 Aug 2025 16:19:28 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Apple SMC RTC
Message-ID: <20250814211928.GA3922106-robh@kernel.org>
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
 <20250812-wip-smc-rtc-v1-1-66a8e96dad60@kernel.org>
 <074fcd4c-0da8-42c4-a567-64fa7e173894@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <074fcd4c-0da8-42c4-a567-64fa7e173894@kernel.org>

On Wed, Aug 13, 2025 at 08:14:51AM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 20:25, Sven Peter wrote:
> > +maintainers:
> > +  - Sven Peter <sven@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: apple,smc-rtc
> > +
> 
> No resources except nvmem? This should be folded into the parent. Don't
> create device node to instantiate drivers.

Well, the reboot node has nvmem entries too, so probably better to keep 
this as child node.

Is there more functionality planned/needed here (for the mfd)? If so, 
please send it all at once. One child node at a time makes DT 
maintainers grumpy.

Rob

