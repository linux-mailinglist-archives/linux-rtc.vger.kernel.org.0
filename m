Return-Path: <linux-rtc+bounces-4532-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14CB0B938
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jul 2025 01:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9833B62DF
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Jul 2025 23:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D0722DFB6;
	Sun, 20 Jul 2025 23:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYQqNfdV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7819829CEB;
	Sun, 20 Jul 2025 23:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753054219; cv=none; b=FC6HsYCM6gJ2RAVSPdp+bsmdlEbO8THXgWyxT4zKs6Yf1SDlLEG/5h2BY6LI5CCwDsb6czVnzvtF5O+0FtkQPKGdWGskqrYpehXXENonzDRJfNyVF/RXXjhZ3Y+VYxM98swaBUqmQHc9UAKCuYjz39NCM57ZVzsm25HKngvFEPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753054219; c=relaxed/simple;
	bh=Uw7o8viWBAcFgkSMOuAiVgFI/VtnomVY/vJupcJsJDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbe4LmMh63ORcu+Cx6oFgcgCIZd7Vkj9P0b//yCof4EVio/NyVrPYaSsRQ1T1KcN0pWuqx7prwogHptk9FX3X9Iw5rsCzWXukacaIkKS16ordwV080PjTgwUJy/7VzdKv24sW+tCKKfdPLHdi9URp7xwHyiVu7Ko4TIT19k7y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYQqNfdV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6832C4CEE7;
	Sun, 20 Jul 2025 23:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054219;
	bh=Uw7o8viWBAcFgkSMOuAiVgFI/VtnomVY/vJupcJsJDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYQqNfdVLiBlC1jA2b3qxIWsp6u90rsBEDuUjDPEHnL94DtSCB2nZoGUKlSddRA4O
	 fb5bIdp9Qvh7LfG+S+KXowgIt5GZyPSbyVu2WuEj6IJhUz8ngWaYAzUChgWr/HAbx5
	 XMru6fVsIDIFIj5Mikj5O7uOXyg0auJKIQA/X1of+9k4keNdrFtR30VORViU60IgGA
	 khqGRzoccntp9a/fYdOTBYpSVwrFaWZbAnbXD4jt8m5/VHQj42d+2z9DumCfEuGOc1
	 i6T1c5yaTC2mC6cRMq6h36vDrZOiaBWkxZvGrTiIMjB9uoVvUuboTEYvgJkmpalZL4
	 c3I8xZwYgkvqg==
Date: Sun, 20 Jul 2025 18:30:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: amlogic,a4-rtc: Add compatible
 string for C3
Message-ID: <175305421760.3067874.9815406474339904105.robh@kernel.org>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
 <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>


On Thu, 17 Jul 2025 17:38:37 +0800, Xianwei Zhao wrote:
> Amlogic C3 SoCs uses the same rtc controller as A5 SoCs. There is
> no need for an extra compatible line in the driver, but add C3
> compatible line for documentation.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


