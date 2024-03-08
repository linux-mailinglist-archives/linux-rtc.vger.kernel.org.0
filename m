Return-Path: <linux-rtc+bounces-793-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B918762AD
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Mar 2024 12:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43EC0B21394
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Mar 2024 11:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDA355794;
	Fri,  8 Mar 2024 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lCprmHlN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E654BD5;
	Fri,  8 Mar 2024 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709895991; cv=none; b=N7cilZ/91w4idim1lZa4R2pvSgUN7Wiqs/K56eAReWav3JNitqbAB3K8mDcJ1vTUgFCNaywJauR2EtXkEL9N7MA+fuSpolzZH+t+x/5+rf+mnLNeI32AAQekNmnbg/ReqiwRBoCC+3B48ABrlvePf6pupDxOQto84t3IUM63VU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709895991; c=relaxed/simple;
	bh=D7U9+tMnd/xl+mH9tfKy3+P7ulSxJqwq7CvbIhbVsp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV70B6FQ6SUTN7s0zr85F2ztIYfEqu3i17pyH0joHB08yqTA27L+CvX7pph9bHZIWibTpOeq3PFGkhr+7WHm5C69bCn1TWWZU5w5SQpRZsA5NcwISafR41da0Ym6hq6VwNYTJkNc/OH0hQr2v6TjkUqhApvBZzaMctZcLLam9OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lCprmHlN; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CF8160005;
	Fri,  8 Mar 2024 11:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709895986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MWTlYsFPqqGs6BQfbZL4kDb0oUDuYdY4Ec1V08TF/6M=;
	b=lCprmHlNEKg+93HlYVWUYDtFKPaps8NzZh5JGqce+pV6RvBxNY/FdX+hcMXriOJTUavLpG
	ybJluwxn63vPhcZknIjEf/2k41/NsvjvFwyCZT4wn3wV1ajmIxUGhc1N4r473PkZlnoCtZ
	peAQdfTsv+GoyKcmbVnoBj14Vb3KYQV1yWSddPwfdM/UuAwQOMt1uv1Z4rxkqoZFJMEVMR
	tNyei4I19Ok6MN1m9tbsiC1SrK8BokwyJ+GMoK3sDdC1n1gofqxBn1l6TX71tFCugmWO1G
	2Tx1HK8GRxeoC0rpqQoATI6vNydi/7QCPx/9xpHhCabB+aX7IOZYe4z0rWA8eA==
Date: Fri, 8 Mar 2024 12:06:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: rtc: abx80x: Improve checks on trickle
 charger constraints
Message-ID: <170989597157.2150728.15920920464980842331.b4-ty@bootlin.com>
References: <20240305080944.17991-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305080944.17991-1-laurent.pinchart@ideasonboard.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 05 Mar 2024 10:09:44 +0200, Laurent Pinchart wrote:
> The abracon,tc-diode and abracon,tc-resistor DT properties are only
> valid for the ABx0804 and ABx0805. Furthermore, they must both be
> present, or neither of them must be specified. Add rules to check this.
> 
> The generic abracon,abx08x compatible string doesn't indicate which chip
> variant is used, but performs auto-detection at runtime. It must this
> also allow the two above properties.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: abx80x: Improve checks on trickle charger constraints
      https://git.kernel.org/abelloni/c/32a6be085835

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

