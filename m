Return-Path: <linux-rtc+bounces-2893-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D611A0B138
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 09:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BAD43A64AF
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 08:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133272343AF;
	Mon, 13 Jan 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NwDC8x5I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B47233D9C;
	Mon, 13 Jan 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757323; cv=none; b=VyXItmphHmtwQX8ClhNdzWd4ZvAOUFdBYFeqEif+teCqGoHvtYBEKVRQF6HIP3/GZJUUmoKqO/iCy+5QSsKl3NtNIxB+VHqblmpBX6oiEXmXU77LT3NsIBEC8LY1pPSrKKFWv95Retrf2nsZETY1Em8S2EBSgprEAWVBlBosOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757323; c=relaxed/simple;
	bh=Z4ATUBSjgWAkswFF1sKiKLZiNcUATxjG6Ijca/M7e70=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcI4SKLNMW8IbWJtJr9gYcOBjii+dP67+tEM+VvW39vzh2H8Vz2xhJBSuxHBUa751TR4cCt+qbnc3lOPCC66ZNPZgyfVFqdbMIJpMWRHvaz+IWSf+bzWyMmVZa8I03I4ScK25xRp0PXA7IvO1eKUgjYvDQA3cZKKwH8M05/rqEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NwDC8x5I; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBF7A1C0009;
	Mon, 13 Jan 2025 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736757319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2M/xnJphBUzCcjZlLtKi3iA13j5DEXJ9BhN7BnaNhrk=;
	b=NwDC8x5ICmGvURqTj97rfvXYBQ216mS20T8xfQvMwMsToJeZtQ4coiFoqyeL5H3io1wULa
	yt2j8pq1retjB4JIx43HldsiClXWAruCWuJ2HqEu2jE1g6BfsWmfFSY6d7rpuYCsURqtde
	k2DvJk0gCa1IuX6tVEVkF9Jzty/dJr1e7Y33FNc5ClzdrvdKppQ0NzDUhC4v0OdHI7ReUD
	E4gFY0O0A7qDaWmTePOU7o2EHUtTz7J0HTjnqYGrGGGclPhSNF1tnbIzLHkFqP7NUr4Nd9
	W1oxdb9YLEsxRruqWMR2crGBMvib3k8Td/FJX3HCTbhW2pIzDB0SG8/XXGvtdQ==
Date: Mon, 13 Jan 2025 09:35:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] rtc: stm32: Use syscon_regmap_lookup_by_phandle_args
Message-ID: <173675730307.1496086.4868139037996576854.b4-ty@bootlin.com>
References: <20250111185405.183824-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111185405.183824-1-krzysztof.kozlowski@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sat, 11 Jan 2025 19:54:05 +0100, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> [...]

Applied, thanks!

[1/1] rtc: stm32: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/abelloni/c/3f76ba88c3fd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

