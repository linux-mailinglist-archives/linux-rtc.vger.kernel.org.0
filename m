Return-Path: <linux-rtc+bounces-783-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54787224C
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 16:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2ACEB23D0D
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC2886AE6;
	Tue,  5 Mar 2024 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKUQi8RM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E8D1DFF8;
	Tue,  5 Mar 2024 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709650907; cv=none; b=r1Hn/xkmLg0DJ9Z6RLBKaECW6np075TBGx/q1JyogdYV5LQ4AZLjkwRAr85KBlilyCj0wN9bDZ15iLgf8MLEPdH3k/s1KpBLYZhDDOgErsyScrviUGu7uHG9r/knns6Xfcpit+W+k7PaZxrpTxggU727DLj/Wmim3DBI8N2ZpUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709650907; c=relaxed/simple;
	bh=e87NwRJGWy0SVGjs+bNh2DbVpGF51XuuFEqWeG9BeKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdOV/+qHVnmp3HIyIvDH8g8BdynoNYjG2qB2chR0BRZffR2L25TJSVoSdkPUwPtNRnINeNNPVlHxoKYAgTFDmJJfJgW2bwJxgFwEcK3J3dxPa2wZEwVkiRGOe8sVNLJ4c7ED4NvECQ5ntJLr4+yuut2lqx6FMw6VT5rjg1PUFtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKUQi8RM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09597C433F1;
	Tue,  5 Mar 2024 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709650907;
	bh=e87NwRJGWy0SVGjs+bNh2DbVpGF51XuuFEqWeG9BeKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKUQi8RMxreckjl7MgMe54nOuDMdTJZGV7nvBwxAGQG18udU8CVCbM0nMauXmaLnN
	 4JGkuxxyUGlsZjmzAHXK6jxyVSVflj1VZDT3mv/9qGCaEMUeCzJUrexa/fS0CZk2uW
	 rNCXVftE5SXJ1zkbrc+q+ajQSg4xBBuQZrM1mLfpb0C60Jn6yE/Obe0m5STq83DkVr
	 k4x82jSgo4fNjbd3txnP5esqQFRLm0dHo2GaJQ1MmGVR8C/6HrBUQs9oJDun4S1mTv
	 o1ydWPDMIXS08/VIILQpT3914RMxVtr0SNqYS9o7Qvypka535DAdnI+gtgmudjJkQL
	 3IrkPaxqzzimw==
Date: Tue, 5 Mar 2024 09:01:45 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] dt-bindings: rtc: abx80x: Improve checks on trickle
 charger constraints
Message-ID: <170965090456.3350146.17689695719804122950.robh@kernel.org>
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


On Tue, 05 Mar 2024 10:09:44 +0200, Laurent Pinchart wrote:
> The abracon,tc-diode and abracon,tc-resistor DT properties are only
> valid for the ABx0804 and ABx0805. Furthermore, they must both be
> present, or neither of them must be specified. Add rules to check this.
> 
> The generic abracon,abx08x compatible string doesn't indicate which chip
> variant is used, but performs auto-detection at runtime. It must this
> also allow the two above properties.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/rtc/abracon,abx80x.yaml          | 25 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


