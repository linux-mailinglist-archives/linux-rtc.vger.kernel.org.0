Return-Path: <linux-rtc+bounces-3519-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA763A64BF7
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 12:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 929783A3B3D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 11:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A011230BC7;
	Mon, 17 Mar 2025 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="st+vdckJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7238D221710;
	Mon, 17 Mar 2025 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209600; cv=none; b=Fctlj4iCx+/EY5awN9gHrwPk4rjXCKBHiXxJn/Za7k1mfoO13HM5SE3fqWl748EuANFPWjnaX9lGFUWEcfZeAtL42CYX74mxC297A+j8Am/S5xE5+jjFfOdEPqrwsTO571aUrXWibGrgnoLGFRF2IChB2NbTZaXT7VRghe/ylaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209600; c=relaxed/simple;
	bh=VRLTGOlYJ+mrs8AsFJHXjRBlLTwMvjty6q/+EJrWmMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3vlKCveypzLOR2keSkYlH/1vLtjSoNBMv/nX31Pt8mGUdDq9WNSqxGihwV0CIilcunWD+oWZTaR+hqujKXgbrqBZuh7YXNKrEXXyPtXjhILeOTgnJ4eLU95SxMNvwXqXr2T+n0HpLRqzE+VO0/7jH/0k0+XRxsTvFgccTvYnpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=st+vdckJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5C5C4CEE3;
	Mon, 17 Mar 2025 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742209599;
	bh=VRLTGOlYJ+mrs8AsFJHXjRBlLTwMvjty6q/+EJrWmMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=st+vdckJoADxJYeVVSwSpokDG6uWFTONcJiutGe+InYYk10smO0z/Cx0l8znIFx+C
	 S4O3JDc43rTB5Pi7w5YK+n0Jf4YUZJK9swCrbFzVbnMEu6FtoRFEOf0p8oCbc+8aTo
	 SCP8/a+A+LiVDjJov3CFFucU4YQJceO60lwM2EQacVb74E1xUFwPw0UEVNmra65P/t
	 kKw601voONy8pGzXhkw3kcjBq9bkjpUPoRFQfvG9Z2DOu05HBofOjGe23xlAAEOnkT
	 f3+B7hRtxpnccUy8Bhs7OKdT3sPinC871NFfWSl4B9kh8zWl1s5xInmo7rXqsMJfIc
	 3LV4EIh/DVk0w==
Date: Mon, 17 Mar 2025 12:06:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: rtc: pcf2127: Reference
 spi-peripheral-props.yaml
Message-ID: <20250317-robust-authentic-cassowary-0eb80b@krzk-bin>
References: <20250315124150.1853699-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250315124150.1853699-1-festevam@gmail.com>

On Sat, Mar 15, 2025 at 09:41:50AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Currently, when the 'spi-max-frequency' property is passed, the following
> dt-schema warning is seen:
> 
> 'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'

Is this real or imaginary error? If imaginary, then do not include it
because it just confuses.

Otherwise: which Makefile target in upstream has this error?

> 
> Fix it by adding a reference to spi-peripheral-props.yaml and change
> it to use 'unevaluatedProperties: false'.

You wrote 7 lines for something as simple as saying this is a SPI
device thus its binding should reference SPI device properties. Please
write concise and accurate commit msgs.

Best regards,
Krzysztof


