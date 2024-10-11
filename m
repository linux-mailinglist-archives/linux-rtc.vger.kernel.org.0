Return-Path: <linux-rtc+bounces-2163-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615CF99A0E1
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 12:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9E03B24F1A
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2024 10:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378DD210C08;
	Fri, 11 Oct 2024 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EPJ3lKWr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7750210C27;
	Fri, 11 Oct 2024 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641425; cv=none; b=a8iZADKrQVfvf99vqxrCirD9P8nPSjv/vM4Gy3B1ZJbV1TKGi8FoL0N8SlhtF6Qi0YwUihqx9safHrIzjUsr/Yt5XDRICPDQ4bZzH9KAn0G+HTe3/PHdboyblpaSak2r1TPk0kgnc5nVwV13q22qZN7euFVu1+tJ9pjOE4p2B9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641425; c=relaxed/simple;
	bh=tdmDXej+rruq9iIm4BoqsPRVc/PA6H40VSSFlvwIaTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PajXbTPjoED2qVVOWoITt1R2R39NmwTH1MPPMof9gnF+gBhFXwpBNSwu3HEzBx3BFf/dO2WpxceuUeumBA0ATZ1UFFLJtyu9SJ+gpAbCEHSBjYxvonxcokZm02DxdfI7b/qNd44tF9xemdbAWB9NavdFaFTjaKwrx3fpKf+4oIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EPJ3lKWr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02A7AE0005;
	Fri, 11 Oct 2024 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728641415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4i8ziNlMdl8ESAarVBofsjoLASi00Z6Fpv46DYhhRFw=;
	b=EPJ3lKWr8jcFNYNEXo75/BSGhR0Mf7KNanp/+hQcwp99pScQEHSBH2Ajrvz0bxfh4OQKtp
	klX+JrkXmUwtKlVvZ3bxVSTHI14mhnG8tVbluOxsr9g2YukEAjsL+RfWXshGMSIxO0pyXv
	jZwZVUBBsMEO3SqAQhNwA8HcXL3dWz4xRDBljOJFdBYLByUQWdU9N79NpIJ43yM40bgnHL
	ijV1JORHtHi3ELUQR3XI/3oj9bZ6NnPNpAkZmQlDg2/Dj5+EwWMz5nODDzcaG3ISiZXbbp
	MDuWi8DqyT9VmkyQ9cOUZ78KE9HckDTJSaC9/7vKm6L5Gig9dhIkDymNJVmKqQ==
Date: Fri, 11 Oct 2024 12:10:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linux4Microchip@microchip.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lewis Hanly <lewis.hanly@microchip.com>,
	pierre-henry.moussay@microchip.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [linux][PATCH v2 13/20] dt-bindings: rtc: mfps-rtc: Add
 PIC64GX compatibility
Message-ID: <172864134907.862705.466406904401257658.b4-ty@bootlin.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-14-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930095449.1813195-14-pierre-henry.moussay@microchip.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 30 Sep 2024 10:54:42 +0100, pierre-henry.moussay@microchip.com wrote:
> PIC64GX is compatible with mfps-rtc without any additional feature
> 
> 

Applied, thanks!

[13/20] dt-bindings: rtc: mfps-rtc: Add PIC64GX compatibility
        https://git.kernel.org/abelloni/c/78f57f8c7a81

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

