Return-Path: <linux-rtc+bounces-4426-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 328BBAF6BFC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jul 2025 09:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8F1B7AD02E
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jul 2025 07:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4592D29B783;
	Thu,  3 Jul 2025 07:49:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ABB225D6;
	Thu,  3 Jul 2025 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528998; cv=none; b=HOVipoGuD3mYgmboxyxvmBhklzNdC8ZN42g/Ouwz5SSie7jrG3QfPP4EIK9sYPM4m3DC2zfZNdbJI9v98h5rxXnTOXsruc+JJ8TLWxSM1HVNpuDvIuc6tNCb0FwEuZqQqCI8lVjwSGkNaXAjb/3GbJCdf/SYW7RIM1iZy5VnZgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528998; c=relaxed/simple;
	bh=pcN/5hW4N6jx4bMgUdQfZkq9j1wobmcYHvmAEGmLez8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gShmeTYWDBwDyM/tHPUPRgX88BTmSgHt1Ejzn1LB5nyRGwHtYIIp4OZsHtwdGd71Um4OkUtl8pXP/1As1Pzt8pLjaFuN+AXtmIn7cLiWnveZs9khp7xpKIcgdUA89yQlYV+kdRWNHl/kLFWcBUG041S3xdBX4gq7YkFWJtCiuJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266CDC4CEE3;
	Thu,  3 Jul 2025 07:49:56 +0000 (UTC)
Date: Thu, 3 Jul 2025 09:49:55 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <20250703-vivacious-wisteria-mustang-fee5ab@krzk-bin>
References: <20250608224252.3902421-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250608224252.3902421-1-robh@kernel.org>

On Sun, Jun 08, 2025 at 05:42:51PM -0500, Rob Herring (Arm) wrote:
> The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> path 'soc'. However, the correct place for RTC bindings (even if it's
> also a "syscon") is the rtc directory, so move the binding there while
> fixing the $id value.
> 
> Fixes: 76517429dbfd ("dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


