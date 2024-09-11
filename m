Return-Path: <linux-rtc+bounces-1947-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B3975D44
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259451F244C4
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05031BB684;
	Wed, 11 Sep 2024 22:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c6WBmUPo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5DD1BA894;
	Wed, 11 Sep 2024 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093849; cv=none; b=hl2kkMEoVDLrjZ9VCGyZdIv/zk6ZfkuUwIHmuXj5rPJbrOhBacMoCljdE8wIf8Q/OdN7wdQKe/D8NJRA+xW+P91HUMEpP+FMQRv8HOq9G775TsQijApqmWLHAg0RfNvXDdaTlwqa4Das32gWKIUWOK1/XvofV0QBQYXNucYZk6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093849; c=relaxed/simple;
	bh=3yA1fLCRb88ToRCRxO/u7OC8Tvw0CXJoSnokE63e36c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDs5qU1lVV8nROQTpxRjW2hTpb3CLi4E28pDexdmLk3gpkbjEO6XvuVWFSw/6gCbzIYCtI1UEyP/vG0VsnRPIJbpx+oOsKxH33ZSbkqIv4zU84nx0TAmcfwA0uk/prhfzKrZFGEGdUpnHOWQclKcoBapO/6dHKhXTqz6yhW0V28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c6WBmUPo; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C80F41C0002;
	Wed, 11 Sep 2024 22:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726093846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kSbquAOSSb9L6U3YXl0vG2FZny6Oz3AeoJa+Pl75X0Y=;
	b=c6WBmUPoGo3EMNV70VLBKDjN0FALnRVP8ZEuEBbegkhCAnaSvL2aBV9PHzmuR3SuqszG1d
	aeq5ujT6/F/PZflecW/eHvQ0hZbJ/rdBLwzuw01quPJNNPz0vt6wBVLk2z3ConrrTMfzbQ
	cE3w6sUBnQdStbkKWUjFhk9NADdZ81ge/PY5lQu5CyP3n8ZVMbhBpJ7VSM0UgLRKtD7fts
	rbdf0wKmBsMQ5auhDUBn0srMfaXpSb98FHu5aFWgFdclIRJ6rd3nR1oozaw+HKpNl/wKlN
	pHtUtbvNCBYvBmwCuA3xj8djQd4IDmKcPQd/mqdrIjrNy6HeWUL9Xu61RVK35w==
Date: Thu, 12 Sep 2024 00:30:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Drop non-trivial duplicate compatibles
Message-ID: <172609381391.1549758.12600929420614564199.b4-ty@bootlin.com>
References: <20240910234431.1043923-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910234431.1043923-1-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 10 Sep 2024 18:44:31 -0500, Rob Herring (Arm) wrote:
> Several compatibles documented in trivial-rtc.yaml are documented
> elsewhere and are not trivial, so drop them.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: Drop non-trivial duplicate compatibles
      https://git.kernel.org/abelloni/c/bf12e99b8342

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

