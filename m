Return-Path: <linux-rtc+bounces-1861-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434B96A2AF
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 17:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 004021F2945C
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 15:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BB1189539;
	Tue,  3 Sep 2024 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pspOMxW0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C791189533;
	Tue,  3 Sep 2024 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725377338; cv=none; b=Js8vC9hFTMVZpdp42E+N/1Y2xwvxzXBER5Lccg7aKAvm5+thR95tmBO+XHMPz4GaBo8ZY/GP2CKHFyiGljqYuf8wqTVwbJznZntCzwfkwlRUY5dwX/yYGjvLkV/6vOeztc/gtPy+vkzwDfk2zN0zpLP9B953rlFKmkyE3Z9Lqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725377338; c=relaxed/simple;
	bh=ALtY1uTGvm73ECIw1cW5WXPk2oh6kLs/WkkEuo01ZUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oA7TjkqD8HisT6OndxfYJgjnbGSKH7wntwZ6w8T9rwYBjO+hxQ8lA05PwgWfDRGj5SdMPT51rA7cBVz90o98FJk8I6qjRbru5mwLo8ozfTHEgsTSxs46vESfuSdG63B+4CRWdD9SEK+uYti6ZcfkhXKon6Q1bGGykBkBqJps9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pspOMxW0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD206C4CEC4;
	Tue,  3 Sep 2024 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725377338;
	bh=ALtY1uTGvm73ECIw1cW5WXPk2oh6kLs/WkkEuo01ZUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pspOMxW0pmWJxTJ4aiM+lyXKx17oey5qAUhcCxk7nC6mjvhzW6iA708Z9v7x6j6J5
	 mcrblk+qCr7l7xazH6r7VAOweNCxy6mAJrGoYYSwVTe+7993xiAroPsRdrsWNnIA1M
	 +BROm2gBmQS4BlEdvYypSd9WmlHNFRB6TxLNEQNDgJ7cPH3+2gVburrdpLy6dh6RYG
	 jRnoE4S1mbkhL1AmKNVs8OAr6KIXIwNE5T+I+QCUxNdAgXu9a/tqDQsUXVK2bvyZpy
	 2gTfWzEuLFi0xt9cc8AojJ9rTEYLUbtikv+12BXm++8JAFKA4Vhath36nCHioFuTuV
	 JkI+Qx68p2fGg==
Date: Tue, 3 Sep 2024 10:28:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alexandre.belloni@bootlin.com, heiko@sntech.de,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 7/8] dt-bindings: arm: rockchip: Add Relfor Saib
Message-ID: <172537733571.1049795.2978620254243576563.robh@kernel.org>
References: <20240903105245.715899-1-karthikeyan@linumiz.com>
 <20240903105245.715899-8-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903105245.715899-8-karthikeyan@linumiz.com>


On Tue, 03 Sep 2024 16:22:44 +0530, Karthikeyan Krishnasamy wrote:
> Add devicetree binding for the Relfor saib board which
> is based on Rockchip RV1109
> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
> 
> Notes:
>     v2:
>     - fix wrong usage of SoC enum
> 
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


