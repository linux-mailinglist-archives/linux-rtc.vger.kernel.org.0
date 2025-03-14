Return-Path: <linux-rtc+bounces-3492-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13556A60C61
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 09:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252083BCDDD
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 08:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A341DC9B3;
	Fri, 14 Mar 2025 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH2SDzvC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F661DAC81;
	Fri, 14 Mar 2025 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942699; cv=none; b=pe8FeN2QqPLwem7mczTiD6yEJqbvcrRbobFpJ6GVojsQ+baBNZ9Plszl74gRniXakna7DfuQ47pn+KWpMAK+ntjEl6BI6Xkc7SItWw2fGrdS9QNJL/IiMW4TgsDMWeVigmKDVWJIP2QKo7u9FFhspbdgZLvplkOlF4+e0v0B7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942699; c=relaxed/simple;
	bh=3mIJSm06YxRGhx1k9fxKkWTTiVXafceuKeP4nRH10+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAxYWYiSuNLK2HMcxk9XKQ+QVrwdaS4PfBGhUVDMg2P6F5l5yOUvm5vzdK1Fq+PoLnn/7yKVyXxPBMlkj/jQhZ/m6/SpdBCb/KoJ5c98JuLAywQH9xR/xLAYTnWYnBMNvIUgalR8+6lAQ4+70bDmPYD3S4fEwyxpFmbwmRWyAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH2SDzvC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB311C4CEE5;
	Fri, 14 Mar 2025 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741942699;
	bh=3mIJSm06YxRGhx1k9fxKkWTTiVXafceuKeP4nRH10+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oH2SDzvCb26vKBz2jjfDjEUORM/o+zOTu6tdhyp2vSOjmgsv1qaxoUK7CS94utsQf
	 JDCMZ/2B0RfV9xsoHBETGGm+zCYJERnQZR823z6kpr7y/KlWGUV/qz8UOO4SBxLVsa
	 XTWQSG2O3c0TD8Pj9G1Tsg44usnZ8wCw+u+R5WhNP18ATlj/+UnHsm8YOo2ehhHjxX
	 P/3PYzxh8cMHRp9lCClxBKjZODLeridLCryg2lqcr54L+3krFA1ETC2gNRRe11Sr48
	 6MrSDiET9u0Zz9h1uc795xDyjcNm8GWiTAy+xJ+ZIaNbEd2QbakO06MvoArx2Y6Bbq
	 1emc8fnLp+pQw==
Date: Fri, 14 Mar 2025 08:58:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] rtc: Avoid a couple of
 -Wflex-array-member-not-at-end warnings
Message-ID: <Z9Pvp4i4Mm4vAXSA@google.com>
References: <Z9PpPg06OK8ghNvm@kspp>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9PpPg06OK8ghNvm@kspp>

On Fri, Mar 14, 2025 at 07:00:54PM +1030, Gustavo A. R. Silva wrote:
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/rtc/rtc-cros-ec.c:62:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/rtc/rtc-cros-ec.c:40:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

