Return-Path: <linux-rtc+bounces-4736-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A64B2B2FECC
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 17:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0498C5E030A
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Aug 2025 15:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611852FB61A;
	Thu, 21 Aug 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8g9HanS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289BF258EFF;
	Thu, 21 Aug 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755789939; cv=none; b=RevQDLx98HCYOx+zL5K09I9ls3RFd+pYQ9Tmx1ybs+1/qYT5oncieUNBXDPnZ2ktsk384rCzeiP5p7lYAHgdPncL3So/JbTDECOCjO2MjKpCXz4OUgprK+47vrNACaF5qBeHxPwJQCU5V6gXT3SbIPLIjU3uHizIpHEXXydczQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755789939; c=relaxed/simple;
	bh=9kJqLOf6Qe+TXpNf2uvky1bKvhlkOmQpjYLqd2IEmos=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S9hztsJYByeBoYhw4f051gksZ++O4XKbdGHCIiFFw7wUqhD/IBD3DRQy4Tw3kJkRz0RAvKn7QE1Ofs2ooKCPdQK5t2I4ITwblBQ72SsFQZAmtI4B/HogUMgBMdIxUCKa9GDjGveZXMRRoNP+6QdeqQ2txqgNTBX/vyjkTQ38HGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8g9HanS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E47C4CEEB;
	Thu, 21 Aug 2025 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755789939;
	bh=9kJqLOf6Qe+TXpNf2uvky1bKvhlkOmQpjYLqd2IEmos=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=n8g9HanS2lu636ESY7KmSZ/Zei+gIK6ydMzOks0Nf/9xeHezuQwjFM0Ty5bJP+6+R
	 bvGK3jB4HUtLnTbqfwveFa4ZZxEdi3RR/q+V858X1muPPWBwHDnBR3bwpiKaNM785p
	 RKFBJqjhDfhEd5yk3d/s1ek51x55nrlL5zMF4g4zxTOF19AoL4aJeoiMiMZJdxOTIA
	 81oIfKUTxKRQp2SBAsZNAXU8bjZmnuy5L2wvEQjkGFB/3QpUjKERLhqIc9YCNWP0iU
	 UPmQcCwuQx5U62WvrKig5WfLkPpq4rL1E1u2bvuM4tkbOC2aTOtpUEu1Au0oLoOWn+
	 sGgym0VGzddZQ==
Message-ID: <4a95cbf3-b3ae-4b26-8db2-dd5cf14a4c0c@kernel.org>
Date: Thu, 21 Aug 2025 17:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
To: James Calligeros <jcalligeros99@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com>
 <20250819201537.GA1223169-robh@kernel.org>
 <CAHgNfTw+wetmZzvPgkANpmSD4b6k0785QZLpBVD9FMqNDnq2EQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHgNfTw+wetmZzvPgkANpmSD4b6k0785QZLpBVD9FMqNDnq2EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20.08.25 01:22, James Calligeros wrote:
> Hi Rob,
> 
> On Wed, Aug 20, 2025 at 6:15 AM Rob Herring <robh@kernel.org> wrote:
>>

[...]

>>> +          apple,fan-maximum:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            pattern: "^[A-Za-z0-9]{4}"
>>> +            description: The maximum speed the current fan can run at
>>> +          apple,fan-target:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            pattern: "^[A-Za-z0-9]{4}"
>>> +            description: Writeable endpoint for setting desired fan speed
>>> +          apple,fan-mode:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            pattern: "^[A-Za-z0-9]{4}"
>>> +            description: Writeable endpoint to enable/disable manual fan
>>> +              control
>>> +          label:
>>> +            $ref: /schemas/types.yaml#/definitions/string
>>> +            description: Human-readable name for the sensor
>>
>> Surely more than apple,key-id is required? How would it be useful with
>> only that? You can know how many fans you have, but have no info or
>> control over them?
> 
> The key specified in apple,key-id is the fan's current speed, which is the
> only key strictly required to enumerate the presence of a fan in the system.
> All of the other keys are optional information that are only really useful
> when implementing manual fan control, which is itself optional as the platform
> really expects the SMC firmware to have control over fan speeds at all times.


Can we at least also require the label? Then we have the SMC key and a 
human readable representation which is already useful.


Sven



