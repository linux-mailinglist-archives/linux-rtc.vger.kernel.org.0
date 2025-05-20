Return-Path: <linux-rtc+bounces-4118-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D675ABD076
	for <lists+linux-rtc@lfdr.de>; Tue, 20 May 2025 09:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 319C27A1DED
	for <lists+linux-rtc@lfdr.de>; Tue, 20 May 2025 07:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6B925D535;
	Tue, 20 May 2025 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTBeUELR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4CF21D3E3;
	Tue, 20 May 2025 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726428; cv=none; b=H+2afjprLDzXCcUNRJuVleXTY/CqmSs8x1b4CW0gkEMGiws+5l4ig2YtfIIcq6J8nkD0/Njs3OmXOBVthEFK756zKhB1Cg4+SYo34vifHrl2I/xyAg8lPrXhHZyhS9ZdRV4+e86dy6QpcaneHeR2igh2wALEpcfEm1iZwBpp5zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726428; c=relaxed/simple;
	bh=gIddd68yKD3hSD8EAb+fAkO130By412LSxY7KY+hbeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TN6apXoBQCMlvB35j2ubPmXfS0ZB1mzwIobAEsnrZC37KaRG2/bf+wHoDl5ujPujtBzhdv8+aaAUtKVYM5ccN2dTVQDTxapiv6FOPcFeDErQFK39BFSYJJtP5Ln+YWzDx3PUYSaVM8IESoyexluRacottT41kHu8AJblgpwp858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTBeUELR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185FAC4CEE9;
	Tue, 20 May 2025 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726428;
	bh=gIddd68yKD3hSD8EAb+fAkO130By412LSxY7KY+hbeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HTBeUELRcsbsKwo9mBgFbVfLy92O54E8lhv0Ibe6UXf4lzVv/oNrzhgWRVlcpUzss
	 Qtn/9DAXXK/MgtF2BOTQQibOShED5+AzKn1m0dQplxG9j1EHAyJEpWASDInlGFrotL
	 Gj1oSdjQ0tOi7PQ+cPyAUkre7AOdTyXbKIJ00Ma/ctVKimN2i0BKbH4QnzTf/ICAG1
	 PubYoo/a/te1WRU9DXls9RI1LqEfWg4SkCvvNz6zRODevp8U9h2oD/558gAnlwcwbB
	 P5qusXeLIdt5Nip550KJQAX0qr/7Bm6SkxEf2FFYxI+zjyIMHx4EurTsYIovDZDhIo
	 265Y2yTetKfHg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHHTr-000000000xI-1Mds;
	Tue, 20 May 2025 09:33:44 +0200
Date: Tue, 20 May 2025 09:33:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sre@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] rtc: drop unused module alias
Message-ID: <aCwwVw8LyTD-D059@hovoldconsulting.com>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423130318.31244-1-johan+linaro@kernel.org>

Hi Alexandre,

On Wed, Apr 23, 2025 at 03:03:11PM +0200, Johan Hovold wrote:
> When working on the pm8xxx driver I noticed that it had a platform
> module alias while only supporting OF probe. This series drops it along
> with unused aliases in the other RTC drivers.

> Johan Hovold (7):
>   rtc: at91rm9200: drop unused module alias
>   rtc: cpcap: drop unused module alias
>   rtc: da9063: drop unused module alias
>   rtc: jz4740: drop unused module alias
>   rtc: pm8xxx: drop unused module alias
>   rtc: s3c: drop unused module alias
>   rtc: stm32: drop unused module alias

With the merge window around corner, could you pick these up for 6.16?

Johan

