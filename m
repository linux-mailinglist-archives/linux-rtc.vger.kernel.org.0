Return-Path: <linux-rtc+bounces-3809-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC989A7D389
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 07:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964CA16750B
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 05:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC44D223329;
	Mon,  7 Apr 2025 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWFSaq41"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31750223316;
	Mon,  7 Apr 2025 05:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744003789; cv=none; b=hA9DRUMZ8PntPyYkaVXMYqmXveX6/WKFQtp70uSc2zRZ39VX7Q5ea7jGJeXmV9vJdTEguK5a+Y//WAPgNvzOCU9kSOGNwFBHNGmlxEqHSGQBm5+F5ieDC3C0k5D9kneQtO9oTW5xFFwi5OfSmynSy8Z/osngJ88AtQs4ywXwtKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744003789; c=relaxed/simple;
	bh=szrAoqEt82D4YY9cVh8krkVtpKKBpZVN7JekLX3bw/s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQuHZrPY1Tz7Q6i2GocQGS2SmIWa4l5PqJEhAd0ShT65hkBaZ7j6veCgVO5gMB4CvJVGlb9fu9DJV66fNYL6r6snw5cyvVDTEgenBaGOuO2xJqwg+8sID/ByNC4R5S326cJHzm47RrbJl90VUf5FEymCA9RvT86FISbNlUJ8pD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWFSaq41; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso19693235e9.0;
        Sun, 06 Apr 2025 22:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003786; x=1744608586; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=szrAoqEt82D4YY9cVh8krkVtpKKBpZVN7JekLX3bw/s=;
        b=JWFSaq41BPEEoLeE4Etnk92IdMcTcb1m+pd6jUF8SKh844DbAdW11nqlN/cjSBSjls
         GH6tqRFD/EslTQxxriMPsBN9dlgwx72FhKxeo8SAXTbuCyQqWFyZNKeCETucdNuMO/QJ
         sbbk60rchOS+wUgJulmB1Qk8lFouNyS2OR2JHXeuFrBI3LMYBLy4wyZuL40W64vTxZEr
         SHy5EcjbGsFcNhSxe9wejXUnP/3XxRlQSrIF4B2UTIvh6g3iZzTRyWaUkEJc91jsLgFZ
         r9JnfH7gMrByUV6zQBz8NCJ/ae8iE2gxPc7WdB3ASyXOLeoy43kEssjpF19ghvnsZw1A
         hAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003786; x=1744608586;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szrAoqEt82D4YY9cVh8krkVtpKKBpZVN7JekLX3bw/s=;
        b=JmgJh6bhL6Pz2sOQpo740mJENqNKfKqyY7YWLjg9tA5K5uQ8D/okTZf3D12FIXEUo7
         fDvIJX9MI7W1BwM8NZBCBwMmuqJL2ihu3e+CfRAq0dM6cDqe//yfoIYVYwnywiBgDStv
         SvahkU/Hnyx1jtr+uVd0sGuEIahU6KHuDkz3O0Cgqi90e1/JUJ6pUiyPKfWVkejOkc7Y
         hYfeil+BLHwp1cOa+iLAqaeRe3ncd808bo6oiIt9mXGLLfLMhN8vSMGrF8KeYOwaAGw8
         rRZqr6nU871m5a8MEnOs33nYCGT7naslvPPZ8DneAS6bcY4H8/5oh0RuCJPsfZcWidtm
         36ow==
X-Forwarded-Encrypted: i=1; AJvYcCUMmldiCWjlb7s9+nTNsmWFHkHQbVMZJH+jSck6K9GNBFBJ5UqWiDcdeCf4VD4YEiuyO2BddYoP61UPyNnm@vger.kernel.org, AJvYcCVBZNc7mI9Wj9gZgdWbgEqMBOEQOquY8nhKHmkSKWP29425MQO0fz1HVF1iPwa762De7Sn++GWPG43U@vger.kernel.org, AJvYcCVQz4rQTJJuyY+yUsoh7X2ILaZk9a0bvoBikPl37aGZsyspcA5hy1oCBF16pNz2WX0J1jua+G2O6Ryr@vger.kernel.org
X-Gm-Message-State: AOJu0YxgxboXwBVBNWh6WG//Wq9mHCq8eluubQvKg/SybnWd2iad8E93
	Ky0K/qMr4FKeErBMv/jbnntIsLi8L9HAL7KpktsmlndQjmIIyckv
X-Gm-Gg: ASbGncuYPttANqyEnZOMc1f3ZtQgtWQZ+wUqAhJGm7camac6U4FfRfZ60gJa4ZXXN1l
	U+5orNpj/3Z6nviILjdpLqY71pA039vDvNoPdEqnGMwLgr0LWWsuS0sKvkZZHgc7p9oXSg0qs1v
	34wpzxypY0p80W+wWVWh4sxV1SF9EderACzbqQTthgVXt85NKr6v3EcgIp4V8UcLHWVRHhKPWaQ
	PV8sx8rkZuCSuVeSR9u7r/HYUyhXSmvjqDFpRkucluk0auy90fKfftmnFFhY2tBGNX6n46rKAut
	f5hb/lu6wZx3rcd99uiAvHHMJZlfW/3Y9h6aHa1cEwBnynsjOsxKMrdYUUGEHuDYHY8AVQls
X-Google-Smtp-Source: AGHT+IHyYNhRU8C385EoBm8RN50B/CpRlG+TT3vGlC2HR7S1QlciSOoOspWYsQeEQA1twwUro0TK+Q==
X-Received: by 2002:a05:600c:5494:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-43ecfa04a99mr74679725e9.28.1744003786226;
        Sun, 06 Apr 2025 22:29:46 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169b8a3sm121113105e9.19.2025.04.06.22.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:29:45 -0700 (PDT)
Message-ID: <a691fe4864debf7592010bc892066beb439c1740.camel@gmail.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  Arnd Bergmann	 <arnd@arndb.de>,
 Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Date: Mon, 07 Apr 2025 07:29:37 +0200
In-Reply-To: <vxjtdvy5vxhmqldgvt4mgeuor36gdjriiai7y3rej3tevuwisa@wpupxzhvc3tt>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
	 <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
	 <vxjtdvy5vxhmqldgvt4mgeuor36gdjriiai7y3rej3tevuwisa@wpupxzhvc3tt>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=mQINBGWpGj8BEACy09IxfduHTzAdqKkf3SmGIHIEquHWHIXqgVIoZo/ufP8mIpsWYwFKP
 9gsCvVvNNugtK8YPN92lbHol35nfZiXLIp16ASRQXYFtBjXj4GAVjUPjaTkQbcedIgD2nEZ/HQSio
 hfnUSS0YmxI0UUJmZFulwQZil6OmPVbbQoda8/In5h/wNRo6y5vJreRhsjqcP5LckLRov3t+jabUz
 n0/1twHNO0SnI508dXenEhQcBX7Wns+JfwRqO8jxBK1P3DntW+n0OJ8DkjSMJjm0zk9JtY28WK332
 Vpq8smZxNDNCfs1YtRMzfEEZKRvxsSMzTxri/cw7VXJa7m138LlyPBkXizjAKqad/Mrthx4ambsWu
 RXyjklYOBYqMEAdlZNLPQnhnIICFwkJ/lnLE8Ek6Dh0NYl1HpsOyvu1ii7VPEXHLMGTKFmFmWtrmC
 UrHIBrAvStMJ2jIRhEyCGDpf6f5dfKNOb3GWRtX36326TDOa2eXWqaTQEPKWRSUwhC3f3j/C/o/vj
 6bDHQ8ZsNcKYxwtSoh+elHT5xtHOMvPBP6gavgZRDnH6wBSHWnXYxyOmZPKr2NuhMwhEyhpvkEq5z
 W6Z/hp5POzZ74GNkIKB5/FpETobgoV/XB2HMnlIUAJE2RYRYwvbgIkKTJxFD4FIIP2DVt/7cT/8ry
 5Nhe2fouscuDQARAQABtDFBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbW
 FpbC5jb20+iQJUBBMBCAA+FiEEYDtVWuq7d7K0J3aR+5lQra83LKgFAmWpGj8CGwMFCQPCZwAFCwk
 IBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ+5lQra83LKjUHA/+KlP0no2WRK1co+2yi0Jz2kbSY61Z
 oX+RqbLqkCoo1UxsU/MddscgjKOfggNASZ1l//jUkx39smTBONmxcauTtY4bB4Q9X8Djk+XO1M9iw
 Gb7feCbnIuRHyvI3qygC+k3XgLIJScui3/yEL0aikd5U4F6nkKyQiPQk7ihKWKyBQXQ+tXS06mUH4
 p0O5BYvxijW32Z9esVB15OB8vUcx2bsdjogEuNc0uwOGMHsVIsW4qupoHRHPc1865uAqzv9vW3a2/
 GOG6IpBFjmXqg7Wy9zwVjSJFMvVxu2xs3RCdpS99aMrfA2na1vjC5A7gNFnr+/N2vtMBP0d0ESfd/
 54zSglu3FW0TIOIz7qkrWQKwiennfUun/mAvCynCrKpCpUMkEgeQw1rHCWpSfnJ6TPG0UfQGNUFyz
 zmBheQRSEksaepfCtqwCxtjF19JZ6yapLi/lQt7YBjwxIPkZRHJNelPkK/bs6yeRJul90+X6UAJst
 Wh4mC7HzVvmopJoCxbInS4+L6qlefdjqhB6NYw9Q5GsRmTKalaqJoW1/kXopeGExCY4r1FP5ZoLHF
 s0xNbycpD2tp/GnI8GlYCIzQED3TNab7IkWP2otXnWAnF8CrqhglBbYnp8oCkgBPatYftO4dWFP3Y
 LVWE0EtoWLLrmiWzHkbWc8YKpWAiFX8OhUJLKtA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi!

On Mon, 2025-04-07 at 09:09 +0800, Inochi Amaoto wrote:
> > Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> > called RTC, but contains control registers of other HW blocks in its
> > address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> > (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> >=20
>=20
> I think this is a mfd device, so why not moving this into mfd subsystem?

MFD is by far the most tricky subsystem to get into [1] ;-)
SOC looks much more realistic [2]

[1] https://lore.kernel.org/all/20250306003211.GA8350@google.com/
[2] https://lore.kernel.org/all/20250303-loud-mauve-coyote-1eefbb@krzk-bin/

--=20
Alexander Sverdlin.


