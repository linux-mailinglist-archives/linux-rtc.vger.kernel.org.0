Return-Path: <linux-rtc+bounces-4836-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C318B4462E
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 21:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45BD16FD97
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 19:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E91267733;
	Thu,  4 Sep 2025 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im42okMu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598FF4D599;
	Thu,  4 Sep 2025 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013085; cv=none; b=BZroDRguEvUu0y0iwpR68VPz3WSsMgeEJt54/2m80k4KquuW+X5TuBpYQLTnf0axEL+a+ZQQGWaQx3Dg1bJd61uyCzkEvv+lpEh4p9ES9mIB6tjNRL8r/8eo1TLHfgxi7dl1INw4qmHwhwk/zoS4t+lRIrzVtrcS0Hy8ByXaXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013085; c=relaxed/simple;
	bh=IokcKs+vLMBO32zCWa1lnXCp6NL4ULAQjAcWJgaaik4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLJqp6/HsubrbMkpI0m7qbICJTEbY4RF5sp2E3tDklFao7ZnuTRf9UPmmzRPvi9XNtaYYcNX0vwZoJ+CWewwWD0AT1fkq5Y8V/yFM+5f3u7Ppq0YXro4qX/SGs+WmhOTrP4ZHAN1m5C5DQD/FVACd0Os8FFF9bXlRBMZ6Re3vP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im42okMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7839C4CEF0;
	Thu,  4 Sep 2025 19:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757013085;
	bh=IokcKs+vLMBO32zCWa1lnXCp6NL4ULAQjAcWJgaaik4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=im42okMuPHcx/8mnx3Cw3ficjYRySl+hlyMKRjq96JutJQfSG0SnW52YenDXHYSQL
	 ng3rPm/jrpk0kpYNlnJhbHi8ITkNaOcE6BGJA9uT6W0sDbw53BP353O8MkZsQACQWE
	 yEvLJ5KQJcRsEX3CDOSU4XJv4O3SVyc2EXRz3MPV9JB/k7TTfs9fLbQr26p2g/sLAn
	 XBqrxsDivSG7z7pupExeiF5LafcyukHCvvCxY6YkhAPpfw/7a3ymDsAP+cmXcbidlR
	 34yLTi6Dvr67EDBk+82sIBUGvrz9uN7009W9Z69SdkyeDENvsOdereSnzmbkVxNYyH
	 jjQJQtMdZoVyg==
Date: Thu, 4 Sep 2025 14:11:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf85063: remove
 quartz-load-femtofarads restriction for nxp,pcf85063
Message-ID: <175701308303.42745.14023304164615181268.robh@kernel.org>
References: <20250903191128.439164-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903191128.439164-1-Frank.Li@nxp.com>


On Wed, 03 Sep 2025 15:11:27 -0400, Frank Li wrote:
> Original TXT binding doc have not limitition about quartz-load-femtofarads,
> which only allow 7000 for nxp,pcf85063.
> 
> So remove it to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: rtc@51 (nxp,pcf85063): quartz-load-femtofarads:0: 7000 was expected
>         from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf85063.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf85063.yaml          | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


