Return-Path: <linux-rtc+bounces-1731-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D04FB95E4EE
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Aug 2024 21:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E50A1C21C30
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Aug 2024 19:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBF54D8C3;
	Sun, 25 Aug 2024 19:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="w9v1seUk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648252868D;
	Sun, 25 Aug 2024 19:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724614572; cv=none; b=W95ymD1mxEVgFHsjz+qRrQA0VG6+8hjVpgw8b/zH9tuU5VGPSZOEc1l9hCKKDYSyLqLlQ8T7uPINHuRH3l59SA1yJrDiGSUk3kdeCwtdZGulmhHfXvE4sordPzRHP8Nt0/r5UNhEc0NfXfOb705HDVMmeHWSQVNPo9KV7xzNQwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724614572; c=relaxed/simple;
	bh=bjgQi0W1Ld6Nlhe5ljDG2TAYgz7sHq4dy4igVOCgYto=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=N1oLIMdnbfWI6U7diixf8fEGFU1D1q5M927aH7j//ZvEIhFGpWFQmhAIz7rJ3+CoOp6uy4rBCJITwu1MrHeW2xp+p8nmfYeYlUUVJiSanrwKHPP2iNce7Uf/Yibxp/7zpZFK2sTmtBmzbbJGxRVAJbNh5wBzqZs5RUETKUmdyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=w9v1seUk; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724614547; x=1725219347; i=markus.elfring@web.de;
	bh=bjgQi0W1Ld6Nlhe5ljDG2TAYgz7sHq4dy4igVOCgYto=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=w9v1seUk1qUDXIC7o/bDODS6lIRCAWpjvS3ZZyd7xNdA3le3N4EgrtyGbcTeM6RD
	 wkL9opxXKf0ARg1r0UVgyUgFZer8LTTnVTiD17+crXNTyyNQ5G4XJ0BU/g2KTClxP
	 PYhvVLY+PA3YJhoPZ7WMHOckcSQNmeJxQyGcvLnd5HR9mtN6/XFHyROuS8prf2kSj
	 13JPW15dx1+v/qQBuVsIYXx3MvJst+yYHO1zWmyAB6hFJg23C8EKEtoMWVvRl8ChA
	 4sSv15UxHdXDSNjWHlLWJsflIggpqWx/zNKOpxqJDPvG9XWcQOCaG3JyDy8RZ0XPB
	 lCmO5LpvUdRxXM04uA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTOhc-1sYVx904UO-00Kxby; Sun, 25
 Aug 2024 21:35:47 +0200
Message-ID: <675f1e34-784f-44d2-9774-2652b919eecd@web.de>
Date: Sun, 25 Aug 2024 21:35:44 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Johan Hovold <johan@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240825183103.102904-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] rtc: at91sam9: fix OF node leak in probe() error path
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240825183103.102904-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:arF0Zy4o4g6S4TXBWa3Il5wlniOMn4xA8VCzf0oURsxwtbIzve+
 iKOgUnqiGBjOHqfuynzSeXIPRGjk/QOqymNVcCRPcxx38ID80jUbUNFGwQnZG59k6RoMhJ4
 l4vPHRKq0uZ+JY8FoSiPGxLxyi5h6X0pazOUcGGuNVu/M/o7AqC8EoecVQF+5voLBc5tDn6
 XErXOZRPNY9Hwc4N2/79Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B9gg9xDVWqM=;6Kjk/FwTmqmXIC1qZUbufPcza1g
 uVPi/dLQIWqzforFSCrnwuYVpD5/XS1SUEOAw1Sq75PM4JU8dwHN8N7g+zz22DPEixM/Vjd+a
 AzSLv7gEwPWY6UqPAZ7O+i+4dwSsFPxKqz8QExBZCuX2sVMA+KvxmfU4hXBlQFey63+UGJ7Q/
 KCti/YVH13zybZqq+mFR9t6NGMjDc/gVMhnEzLnfe3Z9wd1kiuCWtK2kLAf2V62+hNGUscBno
 n05/jAlIRUNNXA3DF2ImuIeS1jgGXZNsPy8Xv+WL0ds/226uz6r6RZZFXVnLfaJuHxWU9rQtw
 GM1Upr1IuvlbQipWwG6eMsEA8pB1Je1wQbPTVl9t7C/45qWKgTXv2NpZl6IpLBp2CQ89Zw/Fz
 3F64q8iJLCd5LpTdcVOd93NA8AbTRIiPMBhUXXG2l37DpcvbchT+4CFVgd8eVjqmcFY4CG3Ji
 p8YzcrwKKsl5bt09Xayzfjm3LSEoSEmzvHJEN1g+q+dSBGy1EoEMyoVhSA9iL2m0Kc35rbpm4
 K4r8MoCZj2bJBmu9vDYbJLD4BLOhDgn+MuUI7DoIYrNsaVJ9+/I9axNFEBk9KBfZTBLdn5ehk
 9eqp9VrJdmm12zjGKOz1LvfjFZ67Lp1CILN+jGkngABkURCuXKvHdRdyNkhIpFI3MzpVzgZea
 q2XRrhHSvPMQZTeMj95Gli6uvORMVVb/VLpYduhl1wxTngF/141p9lPnLoaCW+dSCYpeO6Ywx
 2Bv3YbXmwxZKNQzm3ESWRU1SBjMT01RPRLQH/dxtMJ63vruAVSG5GCaEfrnIgvYU1HEgFDYif
 oMXZu0lRD63YiApC8tumtR2Q==

> Driver is leaking an OF node reference obtained from
> of_parse_phandle_with_fixed_args().

Is there a need to improve such a change description another bit?

+ Imperative mood

+ Tags like =E2=80=9CFixes=E2=80=9D and =E2=80=9CCc=E2=80=9D


Regards,
Markus

