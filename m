Return-Path: <linux-rtc+bounces-4394-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D779AEC103
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 22:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03C521C470B8
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 20:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21669224AFC;
	Fri, 27 Jun 2025 20:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZP6Cahi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F52CCA9;
	Fri, 27 Jun 2025 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056319; cv=none; b=jGsHHgFqd8Xe0WIL2Wk0CCwZgd80TUkW3Nw/J/7GvHnHRChb12ln1AADtyGPj0onRkbbMQ1nebG1Ew85ZI4lh8gYFgvBSWFKY08lAocoRuFfFI5derPNt6fuk1dSbTKsDN3a/LF6tQ/RDZuGHXCcibnyYk5pCGiqL7PwQbInD3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056319; c=relaxed/simple;
	bh=HtEcVIz+4VfFGsPGQrO/U0Tw+w0j1Sfv6dSsO2kyjQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epaXiVyCaMF8RMsJ/D7Hq5KDW1KnO+DdtpQIQWU/A4dc4mvpsuYfI6qmp50E7PtkY6PbnIxRG51oQ74viShTbcS6RLyqhqVPIHHrlh+k9CjaQkRrej7njHbBeOc510CFHamJ8LokYEgiT/k/8qEMXOTVYG1LR4cr5l92+Hvg0XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZP6Cahi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A35C4CEE3;
	Fri, 27 Jun 2025 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056318;
	bh=HtEcVIz+4VfFGsPGQrO/U0Tw+w0j1Sfv6dSsO2kyjQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZP6Cahit5FBx7ly0Zfo9M0zNCRuzAAMItiXK3tqS1Ezvw4gMmKJqUA/Z1AbUKiIM
	 vgtgs0zcoHCi65hxPEjIX431IUXKVghbeVt4+pPbbHsnTnallboMIRoeX09FBEMk+n
	 fA4R7eVGM31MfNFVuGwBgT/AVYcFqxAsy7MoHQd1D46A+5RBM+tW68rrJQWLDa1bw4
	 cfenPmWtEe/ab1l8qAnC7/AsxG/FaP5A2gXe2VevtkHntmngVSkPN1YOjQfp1H8Y/K
	 YDN9/B3Ty8YDnWiYH9rdS7oeFSPrtzF7bcz1o40HslqK0S3BJXugYusvKPXdiFtoYK
	 zeUYtGLBFwo5w==
Date: Fri, 27 Jun 2025 15:31:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: move nxp,lpc3220-rtc to separated
 file from trivial-rtc.yaml
Message-ID: <175105631712.34389.9465755586022053247.robh@kernel.org>
References: <20250624201733.2515971-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624201733.2515971-1-Frank.Li@nxp.com>


On Tue, 24 Jun 2025 16:17:32 -0400, Frank Li wrote:
> nxp,lpc3220-rtc have clocks property, so move it from trivial-rtc.yaml.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/rtc/nxp,lpc3220-rtc.yaml         | 49 +++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
>  2 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,lpc3220-rtc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


