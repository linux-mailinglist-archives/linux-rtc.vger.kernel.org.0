Return-Path: <linux-rtc+bounces-5074-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505EBC7053
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Oct 2025 02:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E153AE7C9
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Oct 2025 00:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A467C199252;
	Thu,  9 Oct 2025 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/miDTD6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E41DF6C;
	Thu,  9 Oct 2025 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759970623; cv=none; b=Yp8Sgv334qMGZwUjckOq94MWeSAzBeRaW6OJkiguvAU5mxW6ZBgBvKp4pYLTQCyn99boRfOyq0s/EvTN44fSQt0H2+Fz4nlJMZPjdSwMubQejaPrgsC/9uB3w1uUMA+TzBkcku93bPoSzNF5tY+tBhds6kMo+vmDqmVIHOnDrxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759970623; c=relaxed/simple;
	bh=dX0f9NNc3ev8nYEkPBXLQP7xHQwnM4V0kjsg1TcaF4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPAC3Bc1srG70TvsS9mzw4+gqAWcWdyA3jCE3CSWg7Y7ZnnLuH6dyJarcaV4WaIoLRagpoedODmyiCuKGkt4G/ZxlzTbWoJx3STqubzn6qX3ZOc+xMIcj4UqkMznNRf6MFoXQrk9uOHdGOnbMCgiZp5Aaq7vhs2XQDxSPm4f0jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/miDTD6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE24C4CEE7;
	Thu,  9 Oct 2025 00:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759970623;
	bh=dX0f9NNc3ev8nYEkPBXLQP7xHQwnM4V0kjsg1TcaF4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/miDTD6rOtxCuQvVhd0sT74JQnWl8xOws2qjCrK8PTGimCO/Cih2WPRfelX3vUrC
	 dFpxSVeBkaCVvgpZUq4wW3XUNYyXwet85zHxnSqCrshdZa5/j+uLXmn1wIYQzOTXWt
	 Sj6X8HpuLR91VXM7yzkuSrAW/xLiet20fPM2ncUH7EEZC1pwhNc/KXWgX8ta0rg5En
	 Yt7VBXXwwivQ3Y/p+vHtjPtQAKinE4o7qERQVfdgxCShMcUfCoeEgAZie90AK5YOIM
	 ycMOijxSoKMVwCNqp0jxYvtFOyodh2z1foXA/7GDpwPskLtQ1uoA4vHjIUQW/7Q+OE
	 VUrpGpn+Hhreg==
Date: Wed, 8 Oct 2025 19:43:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-rtc@vger.kernel.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>, Lee Jones <lee@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH v3 02/13] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <175997061547.377977.15400204653916198003.robh@kernel.org>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
 <20251007-macsmc-subdevs-v3-2-d7d3bfd7ae02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-macsmc-subdevs-v3-2-d7d3bfd7ae02@gmail.com>


On Tue, 07 Oct 2025 21:16:43 +1000, James Calligeros wrote:
> Apple Silicon devices integrate a vast array of sensors, monitoring
> current, power, temperature, and voltage across almost every part of
> the system. The sensors themselves are all connected to the System
> Management Controller (SMC). The SMC firmware exposes the data
> reported by these sensors via its standard FourCC-based key-value
> API. The SMC is also responsible for monitoring and controlling any
> fans connected to the system, exposing them in the same way.
> 
> For reasons known only to Apple, each device exposes its sensors with
> an almost totally unique set of keys. This is true even for devices
> which share an SoC. An M1 Mac mini, for example, will report its core
> temperatures on different keys to an M1 MacBook Pro. Worse still, the
> SMC does not provide a way to enumerate the available keys at runtime,
> nor do the keys follow any sort of reasonable or consistent naming
> rules that could be used to deduce their purpose. We must therefore
> know which keys are present on any given device, and which function
> they serve, ahead of time.
> 
> Add a schema so that we can describe the available sensors for a given
> Apple Silicon device in the Devicetree.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
>  .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
>  MAINTAINERS                              |  1 +
>  3 files changed, 123 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


