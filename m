Return-Path: <linux-rtc+bounces-2517-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB49C4872
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 22:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081D81F22A70
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 21:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DC71B07AE;
	Mon, 11 Nov 2024 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ORgrNDsA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD038F83;
	Mon, 11 Nov 2024 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731361679; cv=none; b=GEwyzeVv4jKwOa+/qjxfDhOYjVFXGXnWJRKe717Ms8gWx2wy3PmDSc3Q3aaJ9BGRLSrVKkeF/H3RUqPVFX7wH7qp7XYeBaH62FViWcq/iWwqmFuwYEmT+mIqGUuNZxv7715wPchU5lmBZUJMZwvbjZWIGCuSg0cZxYbxhZlROqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731361679; c=relaxed/simple;
	bh=BSBxAtTcGQpXnmN5PIotiHJ3HpTUs4yvl5mk0Ne2Zpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfbGNBexRdljwxzufNSGnkeQqpRroc2K5uoejaJERkKmcgjNOl1Z64NaXrIY5TNZLorMxLNauB11e5vt1ty4UXf+NsOv59xzgTXxf56KDi9nkpPk88e8jGDr5VDT2u9HqnougnBpvcWHHmPNMP06lVLs8aPhYR5YGrjtIsddZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ORgrNDsA; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30A8640006;
	Mon, 11 Nov 2024 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731361674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g2b4scH3PheFozFLPBiOdBcm1frxxscZgJklXEJTI+E=;
	b=ORgrNDsApFJAXIlghO7ADZBZShp2JPVY1Y2q72fERJMhFQQ0H0WGk/ugUaRe4z0Rhcti6v
	gg5YRX3ujHhU5Z0GU/nnqnjIfyjakgMolvoxkLQbBpqDQAOjhPozKghR+zYY/eMYPox8Br
	8fOs23Vdb8h+h6rODi8IvccP+ILAeBso/HRis3257iSqm4GrGmw8/sbDKHr90Q8rh30Vh4
	9U7+5osF9YvsVOp05UXXo0fUzcvcAzTiqkuFBuEmMdB2vGBqSdVH2qb+lO2LqGKek1mG9p
	HenFUlRYr5aGhwth98wy7TjGlEhvw2m4UzpHLQsn8FAEKuqqMifoxaZTuf9I2Q==
Date: Mon, 11 Nov 2024 22:47:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 0/3] support for amlogic rtc
Message-ID: <173136163495.3310623.12434068921554307587.b4-ty@bootlin.com>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 08 Nov 2024 13:54:40 +0800, Xianwei Zhao wrote:
> Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.
> 
> 

Applied, thanks!

[1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      https://git.kernel.org/abelloni/c/12defbf1429c
[2/3] rtc: support for the Amlogic on-chip RTC
      https://git.kernel.org/abelloni/c/db26c3d6eb01
[3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
      https://git.kernel.org/abelloni/c/cf6f2ddfd039

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

