Return-Path: <linux-rtc+bounces-5757-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA680D21C0C
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 00:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A93043011007
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jan 2026 23:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CB2392C4A;
	Wed, 14 Jan 2026 23:23:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22708381704
	for <linux-rtc@vger.kernel.org>; Wed, 14 Jan 2026 23:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768433005; cv=none; b=iPQtP6ICh0S7GkSQBFeqztVbG85q85PF4TESwPoXrEKq8wruZS4R1Gb3MuuGV5IRiDG1KvXIf4rqnasXxXVmbFZlke3ro9Mw84okvlNHukxfS+OAP+59A4nZxIBZFYM2kK+9k1WJ7pBrIeSlVFp89ifjtfroyt3BYgN5J0p8QUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768433005; c=relaxed/simple;
	bh=CWRh1mqzGd74sTVRy1BVS1j1Pdc2oQHYsaaSIcffke8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMOfJweGAA6Sqbf5sI83S5ZVE4x2+3gpq9Kyi815W7hbSMn8WQORAuD4adTEt/Dpmq4QRuqljTlMbvGzFGO8n4uBzYz/iv/Jq+wg/W/JZR/rv9D0Et0of1altDiPpQVdnU4pBTYAo7sp8cwttshXLgIo5qIFF4bkWgBZxxINhns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-790992528f6so3070207b3.1
        for <linux-rtc@vger.kernel.org>; Wed, 14 Jan 2026 15:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432994; x=1769037794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQkIGw10WYd18JYf2abTgmvRXHkfDdPrkiazjFeBx98=;
        b=hs5NGDY8A8WWJsoT8w+LUb00pgCaeEA+aHydz+ro+0SbeLWzhkoJt8GAK4qnO4Ir4O
         Dv/fVcG5JaVx6DD8XpxTmHH76JBGOKqXyi5RVBwpH9c1fY1GeCoXGFIB7IweofPohhUM
         Kj3Mvf0a19mH8+b4085aCHepH483LdbjHm1bGAtFctxFWX/k0aUmTAAWKtK1Mss3vnXE
         bNJyypIS82nq8euSa4Nf/orOpmdlQPNIiNwTcWgLFbLOijWFKjuzcOBceMRdGzkgnz2T
         1z2R+Ie9S7m//weQij4LyKPFlAHMPzb3MFTDJ2RzB0EaYqNGxonzHBLX1OG5rmTsxlOo
         B7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3FnFZdr4dJoIjMUBkJ23VBFVV7foanfBIysebJ3/E/jadcQitdWDHKi94s3ZUiOIiC24BRYizicI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQelgB7x6mpv+f+OddWrokV8gKZsCYZRqc89d/Box4XK4SJH2T
	oeRxBU+513aKqhDzyfsnhmQ3wOp3cTTjv3pRYF7eNwaZV7+Hx+8ytPIBr89PvmZy
X-Gm-Gg: AY/fxX4/PFL8MCgQsQrLcPamS4rqsyWbe1bBdbr17kuTMfCtTlbwtscHai/2Du+ozwD
	gsqbLTzGwJFKSrLkwRdrQa7waYs5Sn0Rb1f86LnZOxEzb+zgyGdC0ASKfDrtlINaout7ZlXB9Jc
	kbJlGI8T0xaSmFt4zgyYBDkmtDv9WSJZgzdInQMVeSNe4s4mWXp76m0wiG1o6lmcSD/biyh0ZtR
	hVg2eY3Gor4tYtXKGUd/ZKVFxiGbX/F56fiu09Per5COdecliDZIf3Sn4k9TSHIr6LUJ3AMSqIW
	BBQIxjOtrGh50kPj/cu0mJM0ER50nlgqb62uhXSsL1j0moP9Q+wrikdBwi4Icnk+Fa3n9yitccJ
	MUxCfwsc7hp6f1shLE7C0GfamEXsRTwXQx7mn1eZDf7ZRJgeeYZfuaLXf8yVSoRR7l2dzcOrYjJ
	RUC1U8Ga3DQLaNa8J2+Ie93gi08gfHVD31e9mK
X-Received: by 2002:a05:690c:387:b0:78f:b044:edab with SMTP id 00721157ae682-793a1d183c9mr32488347b3.32.1768432994588;
        Wed, 14 Jan 2026 15:23:14 -0800 (PST)
Received: from [192.168.200.2] (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790b1be88dcsm90437347b3.47.2026.01.14.15.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 15:23:13 -0800 (PST)
Message-ID: <f426f19d-a14c-4d9c-8587-2f7b4290024a@kylinos.cn>
Date: Thu, 15 Jan 2026 07:23:07 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Danilo Krummrich <dakr@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org> <202601081401239bbfff9d@mail.local>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <202601081401239bbfff9d@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 22:01, Alexandre Belloni wrote:
> On 08/01/2026 14:52:08+0100, Danilo Krummrich wrote:
>> On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
>>> On 1/8/26 19:12, Danilo Krummrich wrote:
>>>> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
>>>>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>>>>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>>>>> --- a/drivers/rtc/dev.c
>>>>> +++ b/drivers/rtc/dev.c
>>>>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>>>    		}
>>>>>    		default:
>>>>>    			if (rtc->ops->param_get)
>>>>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>>>>> +				err = rtc->ops->param_get(&rtc->dev, &param);
>>>> It would make more sense to just pass a struct rtc_device than the embedded
>>>> struct device in the RTC callbacks.
>>> I considered passing struct rtc_device directly, but chose &rtc->dev
>>> to minimize changes to existing drivers, since most callbacks use
>>> dev_get_drvdata() on the device parameter.
>> No, you should not expose the embedded base device. For accessing the private
>> data you should add helpers like rtc_get_drvdata(). This is what other
>> subsystems do as well, e.g. [1].
>>
>> [1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#L371
> This is not a correct example as i2c is a bus, just like amba is...
> Actually, I don't think the rework is necessary at all or this would
> mean we need to rewor most of our existing subsystems.
RTC ops callbacks receive struct device * as the first parameter. 
Traditionally this is rtc->dev.parent
(the physical bus device), but Rust drivers store driver data on 
rtc->dev itself, so callbacks need &rtc->dev
  to access it. We considered switching all callbacks to use rtc->dev 
directly, but that would require modifying
  182 RTC drivers and extensive testing/validation work. Instead, we 
propose an alternative approach:

- Added RTC_OPS_USE_RTC_DEV flag (currently stored in rtc->features bitmap)
- Created rtc_ops_dev() helper that returns &rtc->dev if flag is set, 
otherwise
    rtc->dev.parent. Default behavior (returning rtc->dev.parent) maintains
    backward compatibility
- Updated all rtc->ops->callback call sites to use rtc_ops_dev(rtc)

Best regard,
Ke Sun
>
>

