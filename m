Return-Path: <linux-rtc+bounces-5443-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9FC745BC
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 14:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87873354C2A
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 13:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F9A342514;
	Thu, 20 Nov 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXUsnNhT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D569934164C;
	Thu, 20 Nov 2025 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646458; cv=none; b=HpBL2cyp0bBO0Sk/TmCmMoBRtE9ChJPo3BI+/kf9otLxgoWab+USVQ+CTpOxQi1+/BEyO7E3KXq67SrsHpqwKgjRwvcTpIExF/1C5y5rFWsk6D7uxOJQ4nwaFJVfRXSG4jQVEZh+E3g16tX8+exzlmnXk4HgWxnNXPvItGiIBdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646458; c=relaxed/simple;
	bh=CJvDRzJ6YFbRHvYRFotqckNLhW7HcjNVMeyVDaTUxIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKIZPKqUFpmlu/Ws/1rK2HmlJNJZQKZfkLkDaM2LX4esXDcMsZEl3IIZ6EjfExDylUTJcjVDybARRqOIc20XtuFuvMtoRDXLEGXDoJPD+EptviUg7PRTeD0MJ9HpeFo/MfwyUjb5bf1AiBLMAAoKdbR/Z9Kadm/+DR8whIwT96w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXUsnNhT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B79C4CEF1;
	Thu, 20 Nov 2025 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763646457;
	bh=CJvDRzJ6YFbRHvYRFotqckNLhW7HcjNVMeyVDaTUxIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXUsnNhTC9c9YaZ7AYyCFxRs7XWV+0G1RxEDkF/L+x7qwqxzTpsxsvbxaVc5NWahR
	 huMD/s+bOqTwgoExzXL5ZQfoxJoFI2FIy+zJbH/o7FY5MZjtHWGse/BnJEK1rKC6mV
	 LIiHMkFddRichUUmbIrQtGM/hS2SXwYOPRLF2XwFCOyM+li198/4L66MC9bg1kl1w5
	 cx+RS+vJGmtZShei7zVzbQ0EdlmKzOHS9HZKv8rDTZiUb68cuewCMbqSgSQddRWaTC
	 IeP/jDdzMzDe5euq4kc8PzFD9uj/IQ8u8qTIjqpM1vxVh7ppoKlgZQE+BgOWXLT8Ju
	 tS7zCQoeEbIjA==
Date: Thu, 20 Nov 2025 13:47:29 +0000
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v5 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <20251120134729.GD661940@google.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>

On Wed, 12 Nov 2025, James Calligeros wrote:

> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> The hwmon function is an interesting one. While each Apple Silicon device
> exposes pretty similar sets of sensors, these all seem to be paired to
> different SMC keys in the firmware interface. This is true even when the
> sensors are on the SoC. For example, an M1 MacBook Pro will use different
> keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
> necessitates describing which keys correspond to which sensors for each
> device individually, and populating the hwmon structs at runtime. We do
> this with a node in the device tree. This series includes only the keys
> for sensors which we know to be common to all devices. The SMC is also
> responsible for monitoring and controlling fan speeds on systems with fans,
> which we expose via the hwmon driver.
> 
> The SMC also handles the hardware power button and lid switch. Power
> button presses and lid opening/closing are emitted as HID events, so we
> add an input subdevice to handle them.
> 
> Since there are no real dependencies between the components of this series,
> it should be fine for each subsystem to take the relevant patches through
> their trees. The mfd one-liners should be taken in order to avoid trivial
> conflicts. Per [2], the hwmon driver should be merged along with the preceding
> mfd patch adding the __SMC_KEY macro to avoid build errors.

Apart from my (perhaps naive) question on patch 5, the other MFD patches
look okay to me.  Once my question has been answered, I can apply the
MFD, or at least 3 of them, orthogonally.

-- 
Lee Jones [李琼斯]

