Return-Path: <linux-rtc+bounces-4793-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09435B3EF51
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Sep 2025 22:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B977B3A5A3C
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Sep 2025 20:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA09A263F54;
	Mon,  1 Sep 2025 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urOSfoaB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FED2AE8E;
	Mon,  1 Sep 2025 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757795; cv=none; b=H/WfA8vutlMXeG3vmDoI+XTmuBQW11i3eM/lxqAIKII3MERJ2XJhAhRugnJejZq4BukiPAf9ISC1XY05JlGelQh5MmHwUNxPjU8SYHb+KVdMiz66y8hwfgdMUGtOlvwDUSwUfwtvkRf+0d8h+gi8v13iMUOL2zI9Cgyxvl/1Btk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757795; c=relaxed/simple;
	bh=+ofzFwFkLe1JxqqPeYn5hJflNYq8CLMZVstDyrNcAec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnLsucpG9NJYHF0fOjC/ZeOwTtW2O+yDJpUc8rwZjdlVMuaJ/HZwhL7CPk/s/ps6di3l9/8lL3STZeexrVacJ+sUi0iniDOhoeMjdGj5JV+zLWznFG2RLzXVr3h8iY9NLrkUQfX7l2ZWIipOK31xi/p0Ni+CUgBfnUGhDX00SjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urOSfoaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282E5C4CEF0;
	Mon,  1 Sep 2025 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757795;
	bh=+ofzFwFkLe1JxqqPeYn5hJflNYq8CLMZVstDyrNcAec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urOSfoaBbGrOKfS9jYhvXp868Av81+F+t3Rvy2OPslGlZADFQIYcJuZK3+rLzUvxh
	 uQeOlvgUsMiKar+VNLwW2o12h78fhEAJYvKemNaLe6qKMrWhybrlk4HU+eYd5AxpPH
	 SDR04OM1sF4OPNkyTtxz4uvyRvQy4cPkG0U9hxIRCNY/1Fur+4N7O6c8UuuhkqL81p
	 4IHTUWDtALWPrttCth6LRf05BewZXWdzQIGoxgjKD+cOq70kd0kl/pxqEfw+S7FuOf
	 ph07F5F/SXn4VzsFIGcEFYyjVk4ZDehhprvUVhKFBXwTt/ABSTNeUqYBr9w0NiuvfF
	 XOK0J9LC6Md3g==
Date: Mon, 1 Sep 2025 15:16:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: rtc: s3c: Drop S3C2410
Message-ID: <175675779393.270521.9060178611331384153.robh@kernel.org>
References: <20250830130024.142815-4-krzysztof.kozlowski@linaro.org>
 <20250830130024.142815-6-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830130024.142815-6-krzysztof.kozlowski@linaro.org>


On Sat, 30 Aug 2025 15:00:27 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/rtc/s3c-rtc.yaml      | 40 ++-----------------
>  1 file changed, 3 insertions(+), 37 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


