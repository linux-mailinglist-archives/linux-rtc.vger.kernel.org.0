Return-Path: <linux-rtc+bounces-2224-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5FB9A1D2A
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 10:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91A03B26995
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 08:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFC91D1E96;
	Thu, 17 Oct 2024 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQXJR2cu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA21C3F1C;
	Thu, 17 Oct 2024 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729153671; cv=none; b=QniMcqbMeqoJkFOjGZSztm9lMNT3wM3+KyveCuTUo332ni4Xg8lXMTVNXzAlisbXd3a9yHHsb8ibIBfQwtZbHWaBBCpGuqG0kbrznTOOwMBqo7ffOvEhOvbFqOG9ZjFkQfLPzBAeXkhlNFTsVN+h0CdoWkNU6KUxvleX2/P67rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729153671; c=relaxed/simple;
	bh=mKeMUmu9wWEy4M6tYmbNmKQAoJldzHlugNgkL3nXty8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxsYs6KuOldpXP1YgDFZ9S1eYe2Ue9SK3ovvxTLU/hdR1hqkEWO5DD/TNPLed4h9dACyhzdgmU7hhj5gTATbIX3qEIV1owBjrVTyiq+Uh2EX92BVFY39i6Mw5yz/Z/H05Ms0Bg+3/5zKhfaF/dibXrnPyD2w5ZCqfs5eTUQpLE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQXJR2cu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A12C4CEC3;
	Thu, 17 Oct 2024 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729153671;
	bh=mKeMUmu9wWEy4M6tYmbNmKQAoJldzHlugNgkL3nXty8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQXJR2cuWna8A1Dy5yQkw9x80lL5A99d03zdPEv6xKYVdTNuL+uD3cMauYGLwEd/W
	 7AxJjNzjilqPvwp3hhg5jUmigeunfetBxWes3bx+hKygSjrB0NNMg/MjWMggUCFnxo
	 +JAdgD02nHsFqSiUd/NW69Mb/3vZNv4Rx4PbjX8daCR8g/kZGZKKuock5eVHBKPH+e
	 zX0SsuUGyjwyh9WNiDjjNtxVzgG/RpnD7yEqYLTwt+iZQSfRpSyls+hztw0FDrIMj7
	 HWXJPuxZwPTFlrl9KRY7Vybl4mgnX5zGq/vnk8GFgwn3BkoU0UW9HRa3Uvwxvr0Kja
	 WHZ5IH5U6BU/Q==
Date: Thu, 17 Oct 2024 10:27:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, conor@kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: rtc: mpfs-rtc: remove Lewis from
 maintainers
Message-ID: <eufc7sxcgby2ipmesegjzxfnrmjzyedp2bxtbixmmhi7e3odit@fpmasdurqtll>
References: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>

On Tue, Oct 15, 2024 at 07:52:05AM +0100, Conor Dooley wrote:
> Lewis hasn't worked at Microchip for a while, and IIRC never actually
> worked on the RTC in the first place. Remove him from the maintainers
> list in the binding, leaving Daire.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Noticed him in the CC list of your resend, figured it was worth removing
> him.

FWIW
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


