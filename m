Return-Path: <linux-rtc+bounces-1734-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D295EA21
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 09:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE74B2821ED
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 07:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8456C12C473;
	Mon, 26 Aug 2024 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="of0YzNir"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A1D73478;
	Mon, 26 Aug 2024 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724656400; cv=none; b=jfGYGW/Cjb/E18wW8UC2Xl8fYaN7bwSU+7k3IggBVqOH3q6X49hXQbetqhW0cBBsMQFALzjEUcLOXM9SraL4Y4xYYGgtSCpdA49w9GIEc9Mw1jbwF0l9JNQ0GfuwCPl3DF2+hTPWzEMKVWkt+EJGw/tTzbgevTjiDYYnBCFJ70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724656400; c=relaxed/simple;
	bh=txKcwncdUun5j61sOBa6r4kylRkztEC9ZQH8IpgmPfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPN2ttkC/FqlVM7+pOD+0tcJQ9fZxrMwOopKZKCwhfRTBca9xyaKfF9Q8ibfTRZ6vhT+s5tABPAWPVweeBR4bzLlQRNpVLenjO6jDiSsugbl8DRwcuCINQI1sW5LdumzU/QDEMiijFHK2GhCt0BF1LWbgw0aHEbIHZbzSL1kf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=of0YzNir; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724656367; x=1725261167; i=markus.elfring@web.de;
	bh=txKcwncdUun5j61sOBa6r4kylRkztEC9ZQH8IpgmPfg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=of0YzNird3Ory7+duJZsIKjbJt5nXNtqrMjzeygPLUu67u92piGtr/2Tr5Ec5kCA
	 n5wGYZzL2JKfXH/y4sUzMVft+KdLPa4gjSMAnN7Yuekq0D71gnS6hXONod2FfpsWy
	 1adQe4+yWzn4K3zyoVHS7dstr3V6tK+CQOHe7rKg6WPyT+UVQvqpHAZwcwcD8hagI
	 8q/Xk/o9fGki3JzyxWp97ujemp3yUI8BnkyBOsFsUdQuooNTR490kfdccmO55c13/
	 CLQZShMako4lUELdKCAIVbRN/gg8yPgnxQLrSxSQ20l/rIjYgjUTuqou501aFw5cf
	 r0wAqQ0xYJrOMyMx9A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mae3q-1s7lAr1gGA-00bmzD; Mon, 26
 Aug 2024 09:12:47 +0200
Message-ID: <bbc43cc6-0ee9-4cfd-b642-ac888ad9e627@web.de>
Date: Mon, 26 Aug 2024 09:12:32 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rtc: at91sam9: fix OF node leak in probe() error path
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Johan Hovold <johan@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240825183103.102904-1-krzysztof.kozlowski@linaro.org>
 <675f1e34-784f-44d2-9774-2652b919eecd@web.de>
 <391cc2f7-4a88-4565-8653-e46bd77e28f8@linaro.org>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <391cc2f7-4a88-4565-8653-e46bd77e28f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G/QwQvIGzswnDUL+PwS1J1FtcyUK1g8Oh764zQTU9+pUD7qRRpn
 7qJw0uoGbTTSVfmpZWyMl21mpAVNGJL6MQDY+LaVZK3pEk1Dd14oqZSwj0cYNIMNw99aNnX
 h7IKNDOs4IzQudrAB/g9YXi5HCMJacNG62Wnn+W+ZilyRNJMcxJwhGK1KjuLOmdgotd893d
 gN2EtA/TQMR3VVtLg9FPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ql23/rwk8eM=;BRaa1k3F/Zga/pBA1EuOEPPQUiN
 tB4qTXJfQ+oCvI1Y7wBwqH6i1Mw67kBFiZknvYHDDnS6SGC9/kgQyffYpak//r85yz+gCtftt
 soZfGm7VlYYul85U1nuLqJd/PquSzoaliVb/I+jAR8F4Eb3aR3j4fUuzaxaYGnp889opXYWsR
 OZfWHmfofCoMzmdTAKkuUqEXF3YRW2PoZj+IYw/9Cn/u/e1t/KBKNsogr0AxbfFMWHfax1PJ4
 NGJww63xBXHvafXtpTGeydPZEe2TUk/tEI1H1lgrzRSHjwpMktSq0agEXRmHoglaaOrjHuCXo
 r2bz5wvmXkfqSav81AgySHjetusSiArtxoMLOZF4d7kp5hbi3goz44kafDK4jyR8KgQz7nhDH
 0al5v6tYf7ixnWenM3fWLTtaprFlupm3YrgbRq6RPgC79OZhOav774HdKPgYbcCq2U0VCph8F
 2oUnp6ZqUYwYLQTJYeqbCZCoaYnCM9MGBm1zUIi6OyC37HKUO8QrJMNMzdNb01QhAYt1RIXYe
 WUTuZfUdruwa7pxJCXvadu/iHKsOLGfCVybOqN2NX+jRFKG0hvc2ZZQud96IRqDDshJX3DwdZ
 qBTMgyppAhaTebiytrJwUMP5H/fSpxZ7ke1WH8GZT3Nw9sDcA6rBC5SIn0t2Ii9+TdpbA5Zvw
 dgP/dwe4YRlpBeataeuDwWTJHyzr/WEKO4JORisRcPJYXuBYwGL5Tznt5rFOfvB2jaD64QUdq
 w9lilaHbvogy8yysFH/qK+6iFgJ7ql19wJPL9Ll5HMnpGbpNiUOpquSJKxsYU9BWx8e6OOMmV
 f5yIh+509p+bEiLcWAff92NA==

>>> Driver is leaking an OF node reference obtained from
>>> of_parse_phandle_with_fixed_args().
>>
>> Is there a need to improve such a change description another bit?
>>
>> + Imperative mood
=E2=80=A6
> Commit msg is fine.
=E2=80=A6
>> + Tags like =E2=80=9CFixes=E2=80=9D and =E2=80=9CCc=E2=80=9D
>
> Read the patch.

What does hinder you to take requirements from a known information source
better into account?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.11-rc5#n94

Regards,
Markus

