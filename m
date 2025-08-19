Return-Path: <linux-rtc+bounces-4725-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4AB2C3EF
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 14:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C8416742E
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 12:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BCA3043CE;
	Tue, 19 Aug 2025 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJMmDXoz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04121527B4;
	Tue, 19 Aug 2025 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607149; cv=none; b=SfsX/f/bsY1h6w4U/wH7uQt7R24Cn/Dn/5fIWAVF3v8Bb95KTffrzTlth/y9+K6U53t6Feunsa3cHrdUQSxukdG8qRPKkJ5CKe9+ftI7yry9w8GoBP63pnAn0uImyVllmbfIFk2424UZDca39VZs+XE5JuZxl48XncwpO8Z+tqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607149; c=relaxed/simple;
	bh=mq54Juz4cOxSc0yvV5IUeJzSpqLNjIkIZdlTuXERT+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyVsiWhwKjRIz8GaPcJi6cFgYx+eAo2T+1z8d1H20LDVeIa2+wi71eEXu2I6li8l9iiAOUlLwFqthICoJPDBkPoKlC7Lmqi48CFZIUefScNsdeh8D7AxhVwH5B32Xqar4Hdjdoe+NetyOnagc9Dx8QJctY2gEN7Am04sCnvPTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJMmDXoz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48B8C4CEF1;
	Tue, 19 Aug 2025 12:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755607149;
	bh=mq54Juz4cOxSc0yvV5IUeJzSpqLNjIkIZdlTuXERT+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJMmDXoz5HfrnFzyPCJzY0XeT7U2ONbdBoqwSnxcne9u7uFgDTvqtc8S4OA0xfa/6
	 0iWitJUzbhV9M9Er/ro/w2s6jcBB6QbkSuMgqgn9REeEJ7D57PtaDPFm6V7kUMIpDB
	 gRwT3YxPd/zn+R1eu7r0vur7p/KR3u0kB7fJt76tg54WYR/k073Ll0duZfnl3a2mMI
	 FqMnBDD0LyzRbWgbajJzTS232DgrZLqixYLRf7kahu0h50O5eW+waAfxcRVtxuWabN
	 JS1Y2rAxhRPNDsAgbSa/teiwfPZplac8Yp5iWC1XilyHUOLhLHzNSdCyaX8S3H9pDF
	 SVJypEBp93Vfw==
Date: Tue, 19 Aug 2025 13:39:02 +0100
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <20250819123902.GD7508@google.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>

On Tue, 19 Aug 2025, James Calligeros wrote:

> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS                  |   2 +
>  drivers/hwmon/Kconfig        |  12 +
>  drivers/hwmon/Makefile       |   1 +
>  drivers/hwmon/macsmc_hwmon.c | 858 +++++++++++++++++++++++++
>  drivers/mfd/macsmc.c         |   1 +

And here.  And everywhere else.

>  5 files changed, 874 insertions(+)

-- 
Lee Jones [李琼斯]

