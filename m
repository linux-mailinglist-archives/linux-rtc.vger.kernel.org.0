Return-Path: <linux-rtc+bounces-5651-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C59CF684E
	for <lists+linux-rtc@lfdr.de>; Tue, 06 Jan 2026 03:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4951F300D4B1
	for <lists+linux-rtc@lfdr.de>; Tue,  6 Jan 2026 02:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECF62253EB;
	Tue,  6 Jan 2026 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM+E4s6t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64A222585
	for <linux-rtc@vger.kernel.org>; Tue,  6 Jan 2026 02:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667920; cv=none; b=j4Y/wVpLU4Gabc46g6RuGEEZAET3AShfbVMwJ6ApwAqHcs0veiK02hz0fwdb9GhIYEq/gMT9WFy+5n3yDQ9hTQ2tUzf3MI8Syq1OuK4JqTYeHk373nVM6/ZCKR6C0JcfG+v05D0z39K8HRRvwtzQ6xBeXUDZZExiYVi9ipbYBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667920; c=relaxed/simple;
	bh=DTnPdAGyi9zw8bhtutufgjwIgPG14oeBvECc9opM0Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgWjtzYLEZniMcGIfLIOOejgH2z+cEJnyuVGrY2wg+Z6N1swfyYy5IqMe8T/+HZH1OKPZh0F8clGAPMwUl5XJHKvcJZfPjmrMAF40Pa4wTooHeDTrQlZOgy9m91XQzhNu+3V+0W7vhIhBSZkTseCD/M4KEvpuj3fu6v6q8+rCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM+E4s6t; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a07fac8aa1so6135045ad.1
        for <linux-rtc@vger.kernel.org>; Mon, 05 Jan 2026 18:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767667918; x=1768272718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mME2FgNliNdUv4IE4C+D69aNELo1Zoi17RlupLlFIdI=;
        b=EM+E4s6tHTuD8oPJKcMbwjgHxByIJ2cgPsI/NjTaWcJDjO6SyYvaQvR8zIBsUusykA
         j0qT+gympn70ywL9SGHw9A2V00Dr0mGEV2UlVaU0QQQr3L1j7amT9t2TyKpoUe33Vi0m
         BMZ0pzVIwOEfNQ69SQTEIoBgY49p2IZyG7tnv0FghRM/kd11oPiBjvvhUONRkySAcbLU
         7h/RRX5wjkVdxHAf1rzFVaHE175hMy47yTwPVgHdZjmN4Hnb/Y64oLaK+ik569mwGpmw
         d6BJrecoOh93dpL9iG0/t4fjcCoppHkT1pF2UVDfLTyXsbFkio6pS4cY0+kdHT9YzMpT
         caXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767667918; x=1768272718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mME2FgNliNdUv4IE4C+D69aNELo1Zoi17RlupLlFIdI=;
        b=irhZmTAglbPHPByZvBxi6u4JyIEzDGrIKba8COlgDhHB1a3rUL/7Ox7+4zZtl8cYFG
         GO5skdaOcDR8AS2EoMmcpIs9kbYOjwt7+ObIWSyzwqwytwooRZ5ux6vqJusJCR0HuHxV
         9ZpSy95N9WHlHHltYT4P8JTLu0U2O6SyvAjCQEMUZVCQmIJ67IwoNjrQ+IDFJdf8j6zu
         j+lmpuDQuedGespIb9QZVVoCwGD15tUtCCPbo1DfzdVtNdVwWozuZHq/J4jzZpXQ9J2e
         qyzwf58cr9PBTy16Tqgv8yG83zK+2MZlITntAakSoVnD4ZQuR/OS60pqLfrnhALbCYGE
         gSbw==
X-Forwarded-Encrypted: i=1; AJvYcCULPWyd9TPzwASJ43QMQJ3ki/kx+kR5EOvZs89LRf6DHsabmhcyNe04QE7sjZmqKmpq0BKgG8xHOfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhZSwJFhYFjE/aMb2DJZhWXdf39g4jjV6kuLgmwCa1cPUGZ43
	mhr1a4zoA//MWbpcntWnHF/TiLq6W7+C6NC6TiyJtT4usIL+pGKLzAHr
X-Gm-Gg: AY/fxX4AAQyqG6s+q2qpRatGZvrraocqgd1gaxpYiT/v54hwUN21b+btch+F80y7sQe
	+BZmw5yjJMmRmS40zYaQZWqLnLdOjgDRaMxdVWaL3uZ4n4MoQruHjinu4OK8aMbrqt1LJUOp7l2
	ruHAYzyO9pIGz0rAvV0WWU65+pvlC7SaqPEU0NoSQohur22fRMu5s1eM9/8d7T1Sh5w4ANjMO2b
	8ixC8lHcXwqmkqJaCOOtV6RznbQqSqWTOonx6ltvON+P7xbXk5ydTUqLryG38q7MQh+Ryp+whd2
	Hg4mk8DCqdeBMAUkw72VJ4bcE8JImgVBlYNbf+1gSIRFZXI1g8wQWpGaXcAbW4wjxtOwI2t/c6N
	yEJ8nyoRkQjT+Llbn2ejzBjYs+aM2pYitkWqfto3jtLVu0D2judVhwn4FF/rST7x/NpGwceslHh
	loL8+D7wzSUiic5x8FUdbZB9Sv6ozQa5cvnJWL2pfVrfHrefI=
X-Google-Smtp-Source: AGHT+IHqDO50RFlN1sWCZ9F0YlFD48YZv72A+9RcYtax3wH7I4/iNbpOrvyJmtS60ORtcEiq31M6bQ==
X-Received: by 2002:a17:903:1108:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2a3e2cb23b0mr13186195ad.24.1767667917935;
        Mon, 05 Jan 2026 18:51:57 -0800 (PST)
Received: from [10.0.10.3] (210-61-187-173.hinet-ip.hinet.net. [210.61.187.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d81sm5284825ad.81.2026.01.05.18.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 18:51:57 -0800 (PST)
Message-ID: <88b1a3dd-e646-4583-bc41-07ff7e9422a7@gmail.com>
Date: Tue, 6 Jan 2026 10:51:50 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
To: Danilo Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
 <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <DFFTVRMAFF3S.13N6WCNAVVR6I@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/4/26 21:10, Danilo Krummrich wrote:
> On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
>> +/// PL031 RTC driver private data.
>> +#[pin_data(PinnedDrop)]
>> +struct Pl031DrvData {
>> +    #[pin]
>> +    base: Devres<IoMem<0>>,
> Please do not use 0 as generic argument, this should likely be RTC_YLR + 0x4
> (assuming that this register has a width of 32 bit).
>
> It allows you to perform register accesses until RTC_YLR + 0x4 with infallible
> accessors, since the call to IoMem::new() will validate that the memory region
> has at least a size of RTC_YLR + 0x4.
>
>> +    variant: VendorVariant,
>> +    /// RTC device reference for interrupt handler.
>> +    ///
>> +    /// Set in `init_rtcdevice` and remains valid for the driver's lifetime
>> +    /// because the RTC device is managed by devres.
>> +    rtc_device: Option<ARef<RtcDevice>>,
> I don't see a reason for a separate init_rtcdevice() method. Creating the RTC
> device should happen in probe(), which also gets you rid of this odd Option.
>
Hi Danilo,

I encountered an issue while refactoring the RTC abstraction.

Following the platform driver implementation, the AMBA driver stores its 
drvdata in amba_device->dev. However,
the RTC driver also stores its drvdata in the parent device (which is 
also amba_device->dev), causing a conflict.
This was already encountered in v1, which is why the design was awkward.

Do you have any suggestions on how to address this?

Here is part of the code:

  // rust/kernel/amba.rs
impl<T: Driver + 'static> Adapter<T> {
     extern "C" fn probe_callback(
         adev: *mut bindings::amba_device,
         id: *const bindings::amba_id,
     ) -> kernel::ffi::c_int {
         let adev_internal = unsafe { 
&*adev.cast::<Device<device::CoreInternal>>() };
         let info = Self::amba_id_info(adev_internal, id);

         from_result(|| {
             let data = T::probe(adev_internal, info);

             // Referring to the implementation in platform.rs, here 
`dev_set_drvdata(&adev->dev, data)`
             // will clobber the value that has already been set in 
`amba::Driver::probe`.
             adev_internal.as_ref().set_drvdata(data)?;
             Ok(0)
         })
   }
}

// rust/kernel/rtc.rs
impl<T: RtcOps> Adapter<T> {
     unsafe extern "C" fn read_time(
         dev: *mut bindings::device,      // **pointer to the `struct 
device` embedded in  a `struct amba_device`
         tm: *mut bindings::rtc_time,
     ) -> c_int {
         let bound_dev = unsafe { 
device::Device::<device::Bound>::from_raw(dev) };
         let rtc_tm = unsafe { &mut *tm.cast::<RtcTime>() };

         match T::read_time(bound_dev, rtc_tm) {
             Ok(()) => 0,
             Err(err) => err.to_errno(),
         }
   }
}

// drivers/rtc/rtc_pl031_rust.rs
impl amba::Driver for Pl031AmbaDriver {
     ...
     fn probe(
         adev: &amba::Device<Core>,
         id_info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
         let dev = adev.as_ref();
         let io_request = adev.io_request().ok_or(ENODEV)?;
         ...
         // Allocate RTC device.
         let rtcdev = RtcDevice::new::<Pl031DrvData>(dev)?;
         let rtcdev_clone = rtcdev.clone();

         // Set driver data with RTC device reference.
         rtcdev.set_drvdata(try_pin_init!(Pl031DrvData {
             base <- IoMem::new(io_request),
             variant,
             rtcdev: rtcdev_clone,
         }))?;
         ...
         // Register RTC device.
         // **If CONFIG_RTC_HCTOSYS is enabled and the device is rtc0, 
rtc_read_time will be
         // called during the registration process. This requires 
drvdata to be set up before registration.
         Registration::register(dev, rtcdev)?;

         Ok(Pl031AmbaDriver)
     }
}

Best regards,
Ke Sun

>> +}
>> +
>> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
>> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
>> +// Send+Sync).
>> +unsafe impl Send for Pl031DrvData {}
>> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
>> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
>> +// Send+Sync).
>> +unsafe impl Sync for Pl031DrvData {}
> Why not implement Send + Sync for RtcDevice then?
>
>> +// Use AMBA device table for matching
>> +kernel::amba_device_table!(
>> +    ID_TABLE,
>> +    MODULE_ID_TABLE,
>> +    <Pl031DrvData as rtc::DriverGeneric<rtc::AmbaBus>>::IdInfo,
>> +    [
>> +        (
>> +            amba::DeviceId::new_with_data(0x00041031, 0x000fffff, Pl031Variant::ARM.to_usize()),
>> +            Pl031Variant::ARM
>> +        ),
>> +        (
>> +            amba::DeviceId::new_with_data(0x00180031, 0x00ffffff, Pl031Variant::STV1.to_usize()),
>> +            Pl031Variant::STV1
>> +        ),
>> +        (
>> +            amba::DeviceId::new_with_data(0x00280031, 0x00ffffff, Pl031Variant::STV2.to_usize()),
> Why a constructor new_with_data() if you already store data through the generic
> device ID mechanism right below?
>
>> +            Pl031Variant::STV2
>> +        ),
>> +    ]
>> +);

