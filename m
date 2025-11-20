Return-Path: <linux-rtc+bounces-5439-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F38AAC73764
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 11:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E8A03534E3
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 10:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADBE32D0D9;
	Thu, 20 Nov 2025 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr9HHDax"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD58B32D0CC;
	Thu, 20 Nov 2025 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634672; cv=none; b=fjws925p4zE/oWRJKJEg+gcWBVRTn7kRIKkVQiasAxsGiVAWkBDCrguRFst/44nOJ5pBcFXDDAvAtQPM9fkt8TKn3XfNgrAPWzjF5z/STSF5aYlNlifVOQpnWrKJivgU2ARPnA03Rzm73M4vsX1ll7Opa3oogNrJEqjwxt+Wh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634672; c=relaxed/simple;
	bh=ca/nnBhAmoTtF1NVKpguLLq42GQlchXgceGb6iEpvdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE1YIDE6J15spfblrMs8mAZvXiSKo2JcGETjaxorJrTEpAkDx/LuKqJuLcQ3RqGzbXJOyMMnEvBEY3nsjJhbj6pQ1qavIwM0cGGJJMNvl+Nc2t8dESBB24hDJg3jBu/EZw0POKmzWB0eKLyI0pPMnLS9MKLVtoLniO/eu2UqtME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr9HHDax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4873DC116B1;
	Thu, 20 Nov 2025 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763634670;
	bh=ca/nnBhAmoTtF1NVKpguLLq42GQlchXgceGb6iEpvdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jr9HHDaxPHK9zWv+WVDgFSq5LR1K+LtxJJyiCTccg1nsaGbfpSQP/tpjFW4v//HjQ
	 oHsJCOC3yL7IVmelgkImFKyQXgcQdzPgY22Jt4nJAhrk0NL3W9eb+bc06Ivhf6OUbQ
	 5KJ+OZxfbPzIK0UL0JBnCb0/gFPfid8Vabr7J+Hk7J5RJ7eDIkAQ2RWOz7aFCC3NW9
	 NGQtvYug4g+MJaJZy5xoxhUHlkHreXELAJDhLenwxixpO/kQldrF7VIkMVagS5y7vc
	 +1Hq0dxK1V8VIPVqhPBbw+lL7bWhdDOP4ERw7mVuDFe4wvZHDXoyFk8Q3NpFZZ2825
	 q4ggfVH9/v6QQ==
Date: Thu, 20 Nov 2025 10:31:04 +0000
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
Subject: Re: [PATCH 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <20251120103104.GY1949330@google.com>
References: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>

On Fri, 14 Nov 2025, André Draszik wrote:

> Hi,
> 
> With the attached patches the Samsung s5m RTC driver is simplified a
> little bit with regards to alarm IRQ acquisition.
> 
> The end result is that instead of having a list of IRQ numbers for each
> variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> queries the 'alarm' platform resource from the parent (mfd cell).
> 
> Additionally, we can drop a now-useless field from runtime data,
> reducing memory consumption slightly.
> 
> The attached patches must be applied in-order. I would expect them all
> to go via the MFD tree. Alternatively, they could be applied one after
> another during multiple kernel release cycles, but that seems a
> needless complication.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> André Draszik (3):
>       mfd: sec: add rtc alarm IRQ as platform device resource
>       rtc: s5m: query platform device IRQ resource for alarm IRQ
>       mfd: sec: drop now unused struct sec_pmic_dev::irq_data
> 
>  drivers/mfd/sec-common.c         | 41 ++++++++++++++++++++++++++++++----------
>  drivers/mfd/sec-core.h           |  2 +-
>  drivers/mfd/sec-irq.c            | 10 ++--------
>  drivers/rtc/rtc-s5m.c            | 21 ++++++++------------
>  include/linux/mfd/samsung/core.h |  1 -
>  5 files changed, 42 insertions(+), 33 deletions(-)

This needs to be rebased now, right?

-- 
Lee Jones [李琼斯]

