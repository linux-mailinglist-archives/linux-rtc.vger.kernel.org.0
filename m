Return-Path: <linux-rtc+bounces-777-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF7871503
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 05:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45184B21B98
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Mar 2024 04:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898D540BE5;
	Tue,  5 Mar 2024 04:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="fOmaw87X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57F611A;
	Tue,  5 Mar 2024 04:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709614664; cv=none; b=Sr1dlK5nUSJfp3o6y7sQSuneWw+bvAb9M7BMkW/WQPKvQ8GybMzAAaUeMLMuz9Xouv76taKejrfNSK+nGewQhoeW15yc6Bu/6uU6ZBzTx50AqU7TXQlKrpPPt1QXznD1DDFZxeqVUf5jQ2EunyBg8NkTlj1fifYOSqTfZxbsjRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709614664; c=relaxed/simple;
	bh=TF9xMyxymcK8BB/WizDFGoHPI2OXS4ilj10tWbW4bSE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=FlPBu6LRxiNzQRQUss9UXtNqYIksr8gqqC2Th9ckjo0GjaP7PZjxjXpV2KztJXWQrm9ENRKqkWFMYogxh22Y/UiccinEz+0hBR9pxp1W7oL7fcpoWE09+R4Ku+Y1kyYVxe9zLa6l9ghD04z1+oDoGBos6J8OhoKQLr1WptBz19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=fOmaw87X; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 16201440159;
	Tue,  5 Mar 2024 06:47:15 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1709614035;
	bh=TF9xMyxymcK8BB/WizDFGoHPI2OXS4ilj10tWbW4bSE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=fOmaw87XlzmW2r/9hr23sMSjNe+/yTVQRN4dlKgm5BsFszOC15tiiLWnSs/UHUnvv
	 mFS0xgF6Bnq0ep34cAuIjV57x9OvcwEulfRKHr1suZqBDxfK+z6voopThbBdCAQfsI
	 kElMxkIZQjtWGptuk7C47yY6sam1kXViwkeEFOn9bWg9/6MDDS+gGP4b/Q0X9U4w0A
	 lEI0rWDsD/2PePuYrHUdL+SwRkCaUhS/RKoS0c/dQlwxhjUhoT4v9syeSL1I1UeRlL
	 EzK+m1SqX7MjfIiqBa/AlZGFbUxJeFza+pP0bCA+S++603TaPUe9hN3mk53ig1ILeI
	 CSBAPqiHhSRoA==
References: <20240305004222.622-1-laurent.pinchart@ideasonboard.com>
 <20240305004222.622-3-laurent.pinchart@ideasonboard.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Baruch Siach <baruch@tkos.co.il>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, Valentin Raevsky
 <valentin@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/4] dt-bindings: rtc: abx80x: Convert text bindings to
 YAML
Date: Tue, 05 Mar 2024 06:46:10 +0200
In-reply-to: <20240305004222.622-3-laurent.pinchart@ideasonboard.com>
Message-ID: <87jzmhthbj.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Laurent,

On Tue, Mar 05 2024, Laurent Pinchart wrote:
> Convert the abx80x DT bindings to YAML schema. The existing properties
> are kept without modification, and the interrupt property is added as it
> is supported by the driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Done already in rtc-next:

https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=626e2b54645a4e9b58bcb479a565b4a06ff76a26

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

