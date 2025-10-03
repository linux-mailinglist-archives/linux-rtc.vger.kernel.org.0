Return-Path: <linux-rtc+bounces-5043-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20334BB7141
	for <lists+linux-rtc@lfdr.de>; Fri, 03 Oct 2025 15:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F27DF4E3659
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Oct 2025 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927FF1D7E42;
	Fri,  3 Oct 2025 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AlkNhiCd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2C31A0BF1;
	Fri,  3 Oct 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759499446; cv=none; b=WRTRmNpg3ZWwsF60hfLUGbZZq7gDkNpVFUTmZgobabz+pJ34+btJTcbZqfHfKJAsOjSdSQ370dY5+X0h4Y476V4MtYayIyaWMcAiB0BUMHuAKgNWaKNTVtksfGBe61+EqlVp+oaUf963C9err/xu3/5UAzokEBEqkBNWwkBBRl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759499446; c=relaxed/simple;
	bh=2K1jYQzR90qhF8V8+j76XmAlV/ZbdUbBvBcqmABYrNI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Gp+UNQOoghIBSqh/98J9fSmKjm8noQuMd6kgpw2F8iE37RSusI4fYcd5efCdpDZtaixCvmWhdYmi2A3oF8JfjT2SYsnDn/CAcJmFq5YwtdSGIc2ndDOb06WZIO5cAsHnLQRZUa/UW4ijSZPLJndoPZHNffNcLUnmpA6v5kQKITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AlkNhiCd; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1759499435; x=1760104235; i=markus.elfring@web.de;
	bh=atirCXn1cQF6o8Brcc8R5t4ftRT/ga9/SFABkaR79mc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AlkNhiCdx83dMnJHqPpfJYvkrgScQqp0KWsah+zCt8DgCgehb+qlHOHWBh3jHm6g
	 LxocAnDlY0vah6j1bZQXpLJe5E2jN6XhMXREF6hUt1vMXIZa3HjZqA4zoxcp2uU5Z
	 fWb7FVaRbNCw6SC3hSrNtfCFiiXi15qk4+MiQjUZmWVZVZWWhZT3TXlAdYp59e2mH
	 hj1C1WM7J+X/Swei8TcR7fqdB7n7jvABRVqRpQsxtZxt2Euv5+jogkQtjx3iz/8Mj
	 eFeD6N0jZhdVaR9g9ByiaREwrUKPf+sq6du4Fr4Q9oOnUsRCHtDL489TT9HlYOsl5
	 1mhP2Ft+mIJQNgPzBQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.196]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHVet-1v8p2Y03LF-0010qk; Fri, 03
 Oct 2025 15:50:35 +0200
Message-ID: <604731a2-c9d0-4326-8304-4a8c7f416bd4@web.de>
Date: Fri, 3 Oct 2025 15:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandr Sapozhnikov <alsp705@gmail.com>, linux-rtc@vger.kernel.org,
 lvc-project@linuxtesting.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20251002092456.11-1-alsp705@gmail.com>
Subject: Re: [PATCH] rtc: fix error checking in wdt_disable()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251002092456.11-1-alsp705@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PWhuFHgEzHA8eILm4ljlS532xvk3oxoxc2oSTg87Z/3AA6qeNM8
 PAGLJ+0rpFA5vlKxd9jker/6CLobDdAQie8t+PzQoQ18RqZbLi0gOTa2zNW4awZob9q/YGu
 +xazK/2+5YOfvVkz23JpNVsCaOS8hTGyYq77pQtYfcACZa4utt/UWfN3n0Z1Pns3iNEYmd+
 bnSvI/0vu9G5W5H673wTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uZCTMSokwPY=;35D4ZnU7GJIfjGWbbeNXoQfWZ+L
 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

> The i2c_transfer() function may return an error.
> Ignoring errors returned by functions is bad practice.

See also:
https://cwe.mitre.org/data/definitions/252.html


=E2=80=A6
> If the second function call succeeds, data corruption will occur.

Should the function return values be checked for both passed messages?


* Would a corresponding imperative wording become helpful for an improved =
change description?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.17#n94

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus

