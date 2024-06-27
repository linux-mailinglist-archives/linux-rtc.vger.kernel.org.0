Return-Path: <linux-rtc+bounces-1411-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E691B227
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F151C22C18
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A791A2573;
	Thu, 27 Jun 2024 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MeAdOM2P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8071A2550;
	Thu, 27 Jun 2024 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526970; cv=none; b=syGXjLkw0GMGpRXIlD+wSJHq2DJ7oJZq7JprXhHJ6bGbiyVefua/JKuWANwVfLorZ7uKJ3+EH9SeOQr8yjAeRO7NNg5XAyVLy5lugPjVAD7pqhfJfIL5msMX7J7wMOBXTLxVxK3ROXUnsqEI5DgmmnueyKoIMIahOJc/zJT2d3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526970; c=relaxed/simple;
	bh=yb/eZ2niDcWPPpnVyGSmK9ZZBzcIRTs/qW0fQbOHjXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMfV4s8C5HinHKOwQJp+YycYfF4xgmd5P6OrtEbqqNuWYS9AXCQbWvABTPUQZoaG9b0ZAOus44/lTzFX/DUyBtEFuDtigVYvISZik/TkGQ/cMXIrFveT4ft3BU9LxfGeJRUR5ivznMyGoiO53AHqdNev3iJSflL5BGiMJk4APc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MeAdOM2P; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2699360003;
	Thu, 27 Jun 2024 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719526960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sKUal0rtRzpDFun1NmAPul+bWyb1fz2+zk38uh72f5g=;
	b=MeAdOM2PKN4pz7QZH8wwd/uBl5EitfMt+nWzkVCwDoqqo3eQgUp3ZlRBU9XpluzIR+YwSl
	Wauy41Pi6199cbKmNsXc1QxCZB4aOlkXO7nmD11F2ixo7kVPjFd53urJNXAImcfLpm/hHP
	p6Upd+jDV28uWz5RId8R+j+Ngnwae/bCTGHoD78GIr4hUunk7udfKaQ+491phfI2AWSNGa
	8wMa/PC6NHAL4W8J+Qpsb31hoAJJ2rb/AIG63lvPoGoIKILgvAPKTKt96yQgLjY/A6W6xu
	OGbhPebvnDF+eJIzLfgIARC5GWtONqzpUlSV9FQsOD3/FM9gMIKOuvlf3xwWrA==
Date: Fri, 28 Jun 2024 00:22:39 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sean Anderson <sean.anderson@seco.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Joy Chakraborty <joychakr@google.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] rtc: abx80x: Fix return value of nvmem callback on
 read
Message-ID: <171952691798.520431.190079375322166865.b4-ty@bootlin.com>
References: <20240613120750.1455209-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613120750.1455209-1-joychakr@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 13 Jun 2024 12:07:50 +0000, Joy Chakraborty wrote:
> Read callbacks registered with nvmem core expect 0 to be returned on
> success and a negative value to be returned on failure.
> 
> abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
> returns the number of bytes read on success as per its api description,
> this return value is handled as an error and returned to nvmem even on
> success.
> 
> [...]

Applied, thanks!

[1/1] rtc: abx80x: Fix return value of nvmem callback on read
      https://git.kernel.org/abelloni/c/fc82336b50e7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

