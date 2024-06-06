Return-Path: <linux-rtc+bounces-1259-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280E8FE077
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Jun 2024 10:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D491F25AA2
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Jun 2024 08:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4710113C913;
	Thu,  6 Jun 2024 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvZimVsY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FF613C90D
	for <linux-rtc@vger.kernel.org>; Thu,  6 Jun 2024 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717660916; cv=none; b=agw8j+fr4mW1JmNzJ0qunM2M0nuC61KgeGb+2GqNrGTXd8xpBe8xqt4lNeA0ZKgxN0a5jO+4INA+0hk/760AWIvdi9wiUqAakOuqCCpsxzzLEzXA3vpZS/3yu0+Z3i94MT9RDYS7SfTP8kzeOIW+KyfJ4gth1gAcBJMlbvi11N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717660916; c=relaxed/simple;
	bh=41sGre/Ox1VaGggdBpmCBz5S531vabwLivMW+SUAt+k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6P//F2BGRYWULJCFYs0nTDIFQydBnVBUJwhFAvtA3gkyzC+sFDOxyUqrIizZncmE5nhA26yIgC7HL4zOMT+f1FxBnTItMKswOWrGB1hDR/SSfIZammeOelnAI5l4UpdzCDR56VomyA5nYKPSC1SZiixb9H/itm57RPpVI7T984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvZimVsY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2F9C4AF07;
	Thu,  6 Jun 2024 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717660915;
	bh=41sGre/Ox1VaGggdBpmCBz5S531vabwLivMW+SUAt+k=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=RvZimVsYblMi2xscpdezdC+67S6rmW/lxunZEGv20nQcBctomKgc035SN5RHjQm8M
	 dJfJYpG/LKqlV4K5XpSHag8+OAaQO9rEJPwpsHwdqqpPN64eSJ4ntMVZWtfUUiINWd
	 NznQIQPvPb4RMEh8Oex1TqWQGrLPV5Q14aa0kIYmPGBz2Tv8wYnOaOc0UPD9dXSa7S
	 hVY6mkY5hQhlcU6SB3Qf07jB1+14NdXZpv8Ysk0oMomxsghSRnzrVXRbWL6RmBVVLP
	 rkYmVdSlgMltCyApZ+Q6lGPawnTFlX6flGW5n938G/mj/9XaQXQ81wZj57ePV91brQ
	 d9wvdnbb8CZ5A==
Date: Thu, 6 Jun 2024 10:01:49 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Andy Shevchenko
 <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v11 4/8] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <20240606100149.2d042d92@dellmb>
In-Reply-To: <CAHp75Vcdd2LCbiiQj=ejGbOWSun-EfodDKmhr-Y0XcTZ22a4KA@mail.gmail.com>
References: <20240605161851.13911-1-kabel@kernel.org>
	<20240605161851.13911-5-kabel@kernel.org>
	<CAHp75Vcdd2LCbiiQj=ejGbOWSun-EfodDKmhr-Y0XcTZ22a4KA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Jun 2024 21:41:04 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> > +       struct device *dev = kobj_to_dev(kobj);  
> 
> Is this declared in device.h or elsewhere?

It is in device.h.




