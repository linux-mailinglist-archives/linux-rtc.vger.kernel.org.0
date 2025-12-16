Return-Path: <linux-rtc+bounces-5577-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE781CC4645
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 17:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAC7330161B0
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Dec 2025 16:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457B1322B81;
	Tue, 16 Dec 2025 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p8pVkjwM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271CB31DD90;
	Tue, 16 Dec 2025 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765902031; cv=none; b=oMHwHJhW7AoGkZR3syHE2dpJ8NXv+4/H5xJjuundAblOzy1LuslZ+4GpG74hFIXi5UPWz3bvsj6iiS1aJtVqvw2Kp0fRroEOwzyAwdLeAR5VhEWIySWhUh8i0HkkItHenCJJBRGfa+zo8lyoOYMNGgYTjv4nGdryXRzseMtzzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765902031; c=relaxed/simple;
	bh=88Io3/dEnsh7J9mzKOUPUWY7WtjcW6vC0ycmDPe6/LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IW44DBtMcvojBEQegstGwjArXZPd+S3y9R4PpouvulxKN0hdTKyfLnmqvxNA9ev3Sa42vYH53BFvmIZ1OI/IarkgJXqhfNCMv+1EXCPA4zmfa2oqlKSNprZHmLd/iU8StcNqCz85VYowgM0HT3MUsGY55TiEmtK6MvseFdHlWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p8pVkjwM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE598C4CEF1;
	Tue, 16 Dec 2025 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765902030;
	bh=88Io3/dEnsh7J9mzKOUPUWY7WtjcW6vC0ycmDPe6/LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8pVkjwMcYgI5x+cY3Z1C93MjU0pBEi/EtR2zfplBPMG3mcXgBNqND36HWiV6qcbe
	 +rDac8spLkPiOQ8mg8OqWCEvMbYOpxgPFM0W2jFiKGzpJq0pQipX0D7xAyFv0EMWXq
	 jRimw/OyQfriGLM1Td4xiPnbyZLcXqnm3xH2rORmyr+DWyAFFkEIxOXD/hKLYiLH8E
	 2f+E1Rqc46CqI+D9Z9/0zvbi/H4X94LOAFHfRFg761a+/0I0+vtVaFab1iu7Pv19b+
	 yIy8LV03DJZQ215Uw96aVMzwqsOhT76APvq8d1F05Kiu/J1O1yv1R9TMVSd6LaIbIT
	 0aNO256AdOfKQ==
Date: Tue, 16 Dec 2025 16:20:24 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <20251216162024.GI9275@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
 <20251126112935.GA3070764@google.com>
 <20251126140409.GC3070764@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126140409.GC3070764@google.com>

On Wed, 26 Nov 2025, Lee Jones wrote:

> On Wed, 26 Nov 2025, Lee Jones wrote:
> 
> > On Thu, 20 Nov 2025, André Draszik wrote:
> > 
> > > Hi,
> > > 
> > > With the attached patches the Samsung s5m RTC driver is simplified a
> > > little bit with regards to alarm IRQ acquisition.
> > > 
> > > The end result is that instead of having a list of IRQ numbers for each
> > > variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> > > queries the 'alarm' platform resource from the parent (mfd cell).
> > > 
> > > Additionally, we can drop a now-useless field from runtime data,
> > > reducing memory consumption slightly.
> > > 
> > > The attached patches must be applied in-order as patch 2 without 1 will
> > > fail at runtime, and patch 3 without 2 will fail at build time. I would
> > > expect them all to go via the MFD tree. Alternatively, they could be
> > > applied individually to the respective kernel trees during multiple
> > > kernel release cycles, but that seems a needless complication and
> > > delay.
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > > ---
> > > Changes in v2:
> > > - rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org
> > > - return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
> > > - collect tags
> > > - Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org
> > > 
> > > ---
> > > André Draszik (3):
> > >       mfd: sec: add rtc alarm IRQ as platform device resource
> > >       rtc: s5m: query platform device IRQ resource for alarm IRQ
> > >       mfd: sec: drop now unused struct sec_pmic_dev::irq_data
> > > 
> > >  drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
> > >  drivers/mfd/sec-core.h           |  2 +-
> > >  drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
> > >  drivers/rtc/rtc-s5m.c            | 21 +++++---------
> > >  include/linux/mfd/samsung/core.h |  1 -
> > >  5 files changed, 71 insertions(+), 61 deletions(-)
> > 
> > The MFD parts look okay to me.
> > 
> > Once we have the RTC Ack, I'll merge this and send out a PR.
> 
> Ah, I see it.  Apologies.
> 
> It's too late in the cycle to take this now anyway.
> 
> It's on my radar for when -rc1 is released.

This does not seem to apply well on v6.19-rc1.

Please rebase and send as a [RESEND].

-----

% cat drivers/mfd/sec-irq.c.rej
diff a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c	(rejected hunks)
@@ -302,27 +304,28 @@ static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
 		chained_pirq = S2MPG10_COMMON_IRQ_PMIC;
 		break;
 	default:
-		return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
-				    sec_pmic->device_type);
+		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device type %d\n",
+					sec_pmic->device_type);
 	};
 
 	regmap_common = dev_get_regmap(sec_pmic->dev, "common");
 	if (!regmap_common)
-		return dev_err_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
-				    sec_pmic->device_type);
+		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\n",
+					sec_pmic->device_type);
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, regmap_common, sec_pmic->irq, IRQF_ONESHOT, 0,
 				      irq_chip, &irq_data);
 	if (ret)
-		return dev_err_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
-				    irq_chip->name);
+		return dev_err_ptr_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\n",
+					irq_chip->name);
 
 	return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic, chained_pirq,
-					   irq_data, chained_irq_chip, &sec_pmic->irq_data);
+					   irq_data, chained_irq_chip);
 }
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic)
+struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
+	struct regmap_irq_chip_data *sec_irq_chip_data;
 	const struct regmap_irq_chip *sec_irq_chip;
 	int ret;

-- 
Lee Jones [李琼斯]

