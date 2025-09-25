Return-Path: <linux-rtc+bounces-5028-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB4FBA1B2B
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 23:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFFF1387CF1
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Sep 2025 21:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371C527B356;
	Thu, 25 Sep 2025 21:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="mvPiaNjT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b2do54+v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23E27703C;
	Thu, 25 Sep 2025 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837312; cv=none; b=b2A+LmN1M4ZeX5ZIeHKdXp4YrP9PnNxxnGa4ffk4JEtjDD3X0ZTe1eFTX72UQuauvIT0pZg0bNUa4b4clzNalh9u8pNtk2rLlBxT3bRgtdD18RskRh45Qd7mDuIFLqdnjCuUDtF9RRyKIxFeMLw3IagMFswhJ/fUvq3pey7ib9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837312; c=relaxed/simple;
	bh=DyxcNaLeLTAXwCXmaAsOsbORdk3KuM9R8RIrtanTiL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rm4BWNDIwrjrtvui7pX1g/oYFjK17QNrqdRiS0Ztzy3fNW1aTqDZ2tAbWsoXk9BbMQ7e/Jok5WNo4+0aBHElrmF9/wNoNqomFc82GbJ+xml7t+fg+zPzlDvfH2n6NAQQPNMdHlleSKMYTqT9JkVJFmW/lktA49Wiw0hOFuI5PgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=mvPiaNjT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b2do54+v; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 53BC67A0101;
	Thu, 25 Sep 2025 17:55:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 25 Sep 2025 17:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758837309; x=1758923709; bh=bMOAgauWLK
	cjkb+U/xWaCLqqN4luQqsPYL/lLL4gNZw=; b=mvPiaNjTzrFL+61SkDWbx9SCfv
	hPTmHAD/hk4It/ATfu8CBaFgzXSH/9mGw0BqyeYbkMQSiDloJxcF14aKhQONsuFs
	ERditP54PMjXJky0GxtsMnKjKJMEZoT3lPyMmiTcIU7srYAoJXQjluMJkulr4Etj
	DTpUdAOJLyY6BfQ6R7WXQamyCbyIEzFvVxIt0DApRvHyIZ2wfdwZux9j2Yq213np
	ZvHkkLOgBl4YN8IwlByGi4TAgFPi85h4Dp9VuvXbDYKLZ9KUphPLdAhFI0wAcnYv
	rsTyz0U9Fz2ceelQrA0Holm1iH4R7EwpaT7HN3GkH86mzfH+xA6RQv4TbqJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758837309; x=1758923709; bh=bMOAgauWLKcjkb+U/xWaCLqqN4luQqsPYL/
	lLL4gNZw=; b=b2do54+vKyq1phrs1mpReDnkQKGpSIam/qC38X8X0CdmicQ9mZt
	QqFoGpXr4wHmUuqlprfk9SCjcbEXZYVK5TUugt4fAzHnExryPbBUKq4dmRYZ3h/9
	KyobM08DCGBpSS30vQMOfIJw6boaxDDKFyqTVbfOrM0GtuoRswWJP9bTKwxJaU9r
	rMaL052wYyC7ihOsAs5i9IF28MpA/Oee83apOgyaNQmdj2tpG9eg50cm3wsvWGG/
	qnTZZnc5Ouqx0Ic7i8MHu6sIykO0IpAzRpO4EsFwsMtiUBJ1/3rryCEPWdY60OOX
	dvLgSH7+saVqpOr+G+Md0hJ3KJm25R6wfRQ==
X-ME-Sender: <xms:PLrVaIrTPmPJ3971omYrZ1pujtgv575cuh3ErpFSUDcX3Xquov6S5A>
    <xme:PLrVaMX0GWxHI2qoDd_-FPsBOmeKJcHZsnKF72Eh7aH0Fwfqr3njYk4PaXle9NtoX
    zk58gA0biXvPkHrbFkRkNKUvppuOkK1PUSdQa1hihHR14bbo2mnBW4>
X-ME-Received: <xmr:PLrVaO8fBShtiuUuD362fc5nJOYNcrlAwoD0J81KXcuCE9sFhPQVy9FQOgAPmoe2jApg1WES2jCYhwyFaZSLMQRMoyqNQLHVGrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
    gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
    vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
    eplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:PLrVaMYLn9JUJM_ziUL1BOsHZNGsyxVeoQH6kc9Iwfi3657xzVwFxg>
    <xmx:PLrVaOd9L-EPMtZoFyrRJW7zFxeNKEhwFWdvi6_n8sJg4uKGbTKEpw>
    <xmx:PLrVaOpGFPl5jC2x7-AQQREcWYLbIAhBQCYXB4c41srp3gCO2pPdoQ>
    <xmx:PLrVaNAhH1tArwE4HOiEpUZOAH3bFTRjT7vM5DviueEhpRbE5FbZ0g>
    <xmx:PbrVaKsC1CxH40hlHhVkaoYmnet_8jX5zibwFc8iyMd98aYB4hHwPWlF>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 17:55:07 -0400 (EDT)
Date: Thu, 25 Sep 2025 23:55:06 +0200
From: Janne Grunau <j@jannau.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 08/11] mfd: macsmc: Wire up Apple SMC HID subdevice
Message-ID: <20250925215506.GD637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-8-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-8-ce5e99d54c28@gmail.com>

On Wed, Aug 27, 2025 at 09:22:42PM +1000, James Calligeros wrote:
> Add the new SMC HID function to the mfd device
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  drivers/mfd/macsmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> index 286dc150aa6cfdd6d29f769094278daaddabe7c3..893fc47d62b2c956d966d1841895a3fa2b9a3005 100644
> --- a/drivers/mfd/macsmc.c
> +++ b/drivers/mfd/macsmc.c
> @@ -45,6 +45,7 @@
>  #define SMC_TIMEOUT_MS		500
>  
>  static const struct mfd_cell apple_smc_devs[] = {
> +	MFD_CELL_NAME("macsmc-hid"),

I think it would make sense to use MFD_CELL_OF and device nodes for all
macsmc even though it's in the case of macsmc-input (or -hid) not
strictly necessary

>  	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
>  	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
>  	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

Janne

