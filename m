Return-Path: <linux-rtc+bounces-5991-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wByoDIJ7mWlKUQMAu9opvQ
	(envelope-from <linux-rtc+bounces-5991-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 10:31:46 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C647C16C7F1
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 10:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A1B1300CC01
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 09:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E702BEFFB;
	Sat, 21 Feb 2026 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mv1kJVIE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0E24C676;
	Sat, 21 Feb 2026 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771666298; cv=none; b=KZvKB78UOQV2cg8omCZeCGYn+T3IKeJ78IeUbk0UHJhpRsfOSS5hlnkpNVEchIBT50K8tv8A3exgO+1C8M0T+QzDfxKWcyIcJZ6DVn+8ENuMSj3Zn9oC44vjfQgAWIPPnsfNyQQEZB2FF1gVtB9Gx54r2l//BKxaP9BoUbxA0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771666298; c=relaxed/simple;
	bh=JZd3TUO8sHKc1E5nsz3EpGaka1sJimcYCK4bXDXs0Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZK/Rp5yz3ji27yzFB4/VIKPXlCgpbXTOT9Q9RhVlyFJ1L3cvvTw3pH7jOH6U3/nzrutkfJy9AdgPol2iX4eYMeHs2OakzqQMEbK2O5HKpA5EzEH1DtBty2TaL27y7k5zOC9JYDe+THnHB/6QpzZ89zDhEI6NwxT22YzVzkGPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mv1kJVIE; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771666287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0e3N+WFi6mKTSOmzqovnatex4YXABvp7cs8CmE8c8I=;
	b=Mv1kJVIEwjxprAlnE7ePaFZ2mmEYiE6FpB0p8vlY+HTS/ika+2crJrWqhBAZDnTEangKkG
	vF+x6eAzf15i1e6fPAryB+htLyuOxECps0kTkoZ577lF8yybbXLNT+C+B8UtwcG0IUHy/J
	QlJXS36aR4TenAW9wV8MjXXQbj9Zj0c=
Date: Sat, 21 Feb 2026 17:31:09 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260220225341c5eeb835@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-5991-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_DNSFAIL(0.00)[linux.dev : query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin.sun@linux.dev,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i2c.rs:url,bootlin.com:url,platform.rs:url]
X-Rspamd-Queue-Id: C647C16C7F1
X-Rspamd-Action: no action


On 2/21/26 06:53, Alexandre Belloni wrote:
> On 20/01/2026 16:01:40+0800, Ke Sun wrote:
>> On 1/19/26 22:32, Danilo Krummrich wrote:
>>> On Fri Jan 16, 2026 at 5:21 PM CET, Ke Sun wrote:
>>>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>>>> index baf1a8ca8b2b1..eddcc5a69db3b 100644
>>>> --- a/drivers/rtc/dev.c
>>>> +++ b/drivers/rtc/dev.c
>>>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>>    		}
>>>>    		default:
>>>>    			if (rtc->ops->param_get)
>>>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>>>> +				err = rtc->ops->param_get(rtc_ops_dev(rtc), &param);
>>>>    			else
>>>>    				err = -EINVAL;
>>>>    		}
>>> <snip>
>>>
>>>> +/**
>>>> + * rtc_ops_dev - Get the device pointer for RTC ops callbacks
>>>> + * @rtc: RTC device
>>>> + *
>>>> + * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
>>>> + * otherwise returns rtc->dev.parent.
>>>> + */
>>>> +static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
>>>> +{
>>>> +	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
>>>> +		return &rtc->dev;
>>>> +	return rtc->dev.parent;
>>>> +}
>>> I understand that the idea is to gradually convert all drivers to use the RTC
>>> device, rather than it's parent device in RTC device callbacks.
>>>
>>> My main concern is that once that has been achieved it's still not what we want
>>> to have eventually, i.e. RTC device callbacks should ideally take a struct
>>> rtc_device as argument and not the embedded base struct device.
>>>
>>> I.e. we'd kick off a conversion process that won't reach the actual desired
>>> state.
>> Hi Danilo,
>>
>> This is indeed an intermediate step.
>>
>> Full cleanup is in progress, but it's large and untested. I'm working on a
>> complete cleanup involving ~190+ files across arch/, drivers/rtc/, and
>> drivers/virtio/. Most changes are straightforward interface replacements,
>> but some drivers need additional modifications. Given the scale, I haven't
>> fully tested everything and can't guarantee correctness yet.
>>
>> The intermediate step enables gradual migration, allowing us to:
>> - Clean up and test each rtc driver incrementally
>> - Ensure correctness through gradual changes
>> - Avoid breaking existing functionality
>>
>> Once all cleanup is complete and tested, changing all rtc_class_ops
>> callbacks to use struct rtc_device * will be much simpler and safer.
>>
>> Currently there seem to be only these two approaches. I'm still waiting
>> for Alexandre's suggestion on how to proceed specifically, but haven't
>> received a response yet.
> I'm sorry, I still don't see the point of doing this. The driver will
> almost always need to set its driver data in the parent device because
> we need to be able to handle interrupts, suspend/resume or .remove(). So
> while intellectually, this would be more satisfying to have the
> callbacks take a struct rtc_device, functionally this doesn't have any
> purpose because we need to use the parent drvdata anyway.
>
> Said differently, you should explain why a device driver must not call
> amba_set_drvdata() ?

As in platform.rs [1] and i2c.rs [2], set_drvdata is always called by
the bus Adapter's probe_callback, not by the device driver.

[1]: 
https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/platform.rs#L80
[2]: 
https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/i2c.rs#L160

In Rust the Adapter already sets drvdata on the bus device in probe. If
the driver also calls amba_set_drvdata() there, it overwrites that
pointer; on remove/shutdown the framework then gets wrong data and can
hit use-after-free or crashes. So only the framework must set drvdata
on the bus device.

This applies only to the Rust implementation; in C, calling
amba_set_drvdata() is fine. In the Rust design the bus device owns the
bus device's drvdata and the class device owns the class device's
drvdata, so the class driver must not set drvdata on the bus device.

This is my understanding of the Rust device driver abstraction design.
Danilo is the authority on this.

Best regards,
Ke Sun

> Out of 29 drivers, 18 are doing so.
>

