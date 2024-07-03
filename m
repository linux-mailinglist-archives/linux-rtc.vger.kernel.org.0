Return-Path: <linux-rtc+bounces-1443-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E280A925AE8
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Jul 2024 13:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886A8296EB2
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Jul 2024 10:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA28B178CE7;
	Wed,  3 Jul 2024 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NuGkBQe/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510513959D;
	Wed,  3 Jul 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003227; cv=none; b=oADhORz63lUuC9mbj93SMSdYmdLQ1wFX2WoKVG3mNyfdaxAwg7V57jONfplElIPcHneVFRqCqlVLWRm3St7Sxw/xQJj4PEut2wXcOkIqqGcaalK29Gl8biYAzISjUtWxdoocdcI9ziN6w7s8FK356M2vj4qn7IgLs+zPyMwKE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003227; c=relaxed/simple;
	bh=zqhNKkByO62L09f1PbEYUwBd5x6TJuhIrMg+Mqx4eUw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rw2DiYomsBuFxNjDALHwih/z8xn/yW1ZfEzaIYJDp1vui9c9qdNzxj5kvAa9h/6YZ7kyrZuQ+YPu6kWYepm5QG1tGPCWM8YleyaQgvMBf1HV1r5uY/iaZd4Tf3PgQUFfaEhS+inY359Ea7tCsIemMGbe4d/H2/iZiZVD/aPnY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NuGkBQe/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rqObL9ZXGRydSULbQuBby1JVG4WzP2AoNB7FH8o3U0w=; b=NuGkBQe/OU25s0vT5tV6cCx9Y9
	d5qHxwmfjk7LdT+YecpUKTox3V7JoXm8VIAEdq4quVcmboaU7mRMl5FPUs+yipnCT3hqcM4lw1L/y
	0nUWpr8K44R2XM4x0k0XFN2n0tTx0esPfAHYQhDHt7DoqudILgonkVyMLgV/IykGsSDu7LCgOfJUL
	98l/NN+4asYQ2Q4Lqp986i2XvlZnkVicY2XwEfBE0NnE25nW26PIwm9S0vsMvWerTE+dyLG4e2CAc
	njuZiEQYlNX3nAIXY/i/RnE6GZd03HjrizBO2GM6Vc6r5fi82YO1h2ynmFXOrAZK4HiAB9DH+Xvj4
	0fvAj7Dg==;
Received: from [2001:8b0:10b:5:c274:66b2:6bbc:35da] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOxPN-00000001ji0-0hjy;
	Wed, 03 Jul 2024 10:40:17 +0000
Message-ID: <352a7f910269daf1a7ff57ea4a41a306d6981b21.camel@infradead.org>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 linux-kernel@vger.kernel.org,  virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-rtc@vger.kernel.org, "Ridoux,
 Julien" <ridouxj@amazon.com>,  virtio-dev@lists.linux.dev, "Luu, Ryan"
 <rluu@amazon.com>, "Chashper, David" <chashper@amazon.com>
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>, Jason Wang
 <jasowang@redhat.com>, John Stultz <jstultz@google.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 03 Jul 2024 11:40:16 +0100
In-Reply-To: <02077acb-7f26-4cfb-90be-cf085a048334@opensynergy.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
	 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
	 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
	 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
	 <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
	 <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com>
	 <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org>
	 <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com>
	 <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org>
	 <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
	 <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org>
	 <51087cd7149ce576aa166d32d051592b146ce2c4.camel@infradead.org>
	 <cb11ff57-4d58-4d47-824b-761712e12bdc@opensynergy.com>
	 <3707d99d0dfea45d05fd65f669132c2e546f35c6.camel@infradead.org>
	 <19c75212-bcb6-49e3-964d-ed727da2ba54@opensynergy.com>
	 <02E9F187-A38C-4D14-A287-AFD7503B6B0F@infradead.org>
	 <02077acb-7f26-4cfb-90be-cf085a048334@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-hmmOuEDQGPI61e8TF6l2"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-hmmOuEDQGPI61e8TF6l2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-07-03 at 11:56 +0200, Peter Hilber wrote:
> On 02.07.24 20:40, David Woodhouse wrote:
> > On 2 July 2024 19:12:00 BST, Peter Hilber <peter.hilber@opensynergy.com=
> wrote:
> > > On 02.07.24 18:39, David Woodhouse wrote:
> > > > To clarify then, the main types are
> > > >=20
> > > > =C2=A0VIRTIO_RTC_CLOCK_UTC =3D=3D 0
> > > > =C2=A0VIRTIO_RTC_CLOCK_TAI =3D=3D 1
> > > > =C2=A0VIRTIO_RTC_CLOCK_MONOTONIC =3D=3D 2
> > > > =C2=A0VIRTIO_RTC_CLOCK_SMEARED_UTC =3D=3D 3
> > > >=20
> > > > And the subtypes are *only* for the case of
> > > > VIRTIO_RTC_CLOCK_SMEARED_UTC. They include
> > > >=20
> > > > =C2=A0VIRTIO_RTC_SUBTYPE_STRICT
> > > > =C2=A0VIRTIO_RTC_SUBTYPE_UNDEFINED /* or whatever you want to call =
it */
> > > > =C2=A0VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR=20
> > > > =C2=A0VIRTIO_RTC_SUBTYPE_UTC_SLS /* if it's worth doing this one */
> > > >=20
> > > > Is that what we just agreed on?
> > > >=20
> > > >=20
> > >=20
> > > This is a misunderstanding. My idea was that the main types are
> > >=20
> > > > =C2=A0VIRTIO_RTC_CLOCK_UTC =3D=3D 0
> > > > =C2=A0VIRTIO_RTC_CLOCK_TAI =3D=3D 1
> > > > =C2=A0VIRTIO_RTC_CLOCK_MONOTONIC =3D=3D 2
> > > > =C2=A0VIRTIO_RTC_CLOCK_SMEARED_UTC =3D=3D 3
> > >=20
> > > VIRTIO_RTC_CLOCK_MAYBE_SMEARED_UTC =3D=3D 4
> > >=20
> > > The subtypes would be (1st for clocks other than
> > > VIRTIO_RTC_CLOCK_SMEARED_UTC, 2nd to last for
> > > VIRTIO_RTC_CLOCK_SMEARED_UTC):
> > >=20
> > > #define VIRTIO_RTC_SUBTYPE_STRICT 0
> > > #define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 1
> > > #define VIRTIO_RTC_SUBTYPE_SMEAR_UTC_SLS 2
> > >=20
> >=20
> > Thanks. I really do think that from the guest point of view there's
> > really no distinction between "maybe smeared" and "undefined
> > smearing", and have a preference for using the latter form, which
> > is the key difference there?
> >=20
> > Again though, not a hill for me to die on.
>=20
> I have no issue with staying with "undefined smearing", so would you agre=
e
> to something like
>=20
> VIRTIO_RTC_CLOCK_SMEAR_UNDEFINED_UTC =3D=3D 4
>=20
> (or another name if you prefer)?

Well, the point of contention was really whether that was a *type* or a
*subtype*.

Either way, it's a "precision clock" telling its consumer that the
device *itself* doesn't really know what time is being exposed. Which
seems like a bizarre thing to support.

But I think I've constructed an argument which persuades me to your
point of view that *if* we permit it, it should be a primary type...

A clock can *either* be UTC, *or* it can be monotonic. The whole point
of smearing is to produce a monotonic clock, of course.

VIRTIO_RTC_CLOCK_UTC is UTC. It is not monotonic.

VIRTIO_RTC_CLOCK_SMEARED is, presumably, monotonic (and I think we
should explicitly require that to be true in virtio-rtc).


But VIRTIO_RTC_CLOCK_MAYBE_SMEARED is the worst of both worlds. It is
neither known to be correct UTC, *nor* is it known to be monotonic. So
(again, if we permit it at all) I think it probably does make sense for
that to be a primary type.


This is what I currently have for 'struct vmclock_abi' that I'd like to
persuade you to adopt. I need to tweak it some more, for at least the
following reasons, as well as any more you can see:

 =E2=80=A2 size isn't big enough for 64KiB pages
 =E2=80=A2 Should be explicitly little-endian
 =E2=80=A2 Does it need esterror as well as maxerror?
 =E2=80=A2 Why is maxerror in picoseconds? It's the only use of that unit
 =E2=80=A2 Where do the clock_status values come from? Do they make sense?
 =E2=80=A2 Are signed integers OK? (I think so!).

=20
/*
 * This structure provides a vDSO-style clock to VM guests, exposing the
 * relationship (or lack thereof) between the CPU clock (TSC, timebase, arc=
h
 * counter, etc.) and real time. It is designed to address the problem of
 * live migration, which other clock enlightenments do not.
 *
 * When a guest is live migrated, this affects the clock in two ways.
 *
 * First, even between identical hosts the actual frequency of the underlyi=
ng
 * counter will change within the tolerances of its specification (typicall=
y
 * =C2=B150PPM, or 4 seconds a day). This frequency also varies over time o=
n the
 * same host, but can be tracked by NTP as it generally varies slowly. With
 * live migration there is a step change in the frequency, with no warning.
 *
 * Second, there may be a step change in the value of the counter itself, a=
s
 * its accuracy is limited by the precision of the NTP synchronization on t=
he
 * source and destination hosts.
 *
 * So any calibration (NTP, PTP, etc.) which the guest has done on the sour=
ce
 * host before migration is invalid, and needs to be redone on the new host=
.
 *
 * In its most basic mode, this structure provides only an indication to th=
e
 * guest that live migration has occurred. This allows the guest to know th=
at
 * its clock is invalid and take remedial action. For applications that nee=
d
 * reliable accurate timestamps (e.g. distributed databases), the structure
 * can be mapped all the way to userspace. This allows the application to s=
ee
 * directly for itself that the clock is disrupted and take appropriate
 * action, even when using a vDSO-style method to get the time instead of a
 * system call.
 *
 * In its more advanced mode. this structure can also be used to expose the
 * precise relationship of the CPU counter to real time, as calibrated by t=
he
 * host. This means that userspace applications can have accurate time
 * immediately after live migration, rather than having to pause operations
 * and wait for NTP to recover. This mode does, of course, rely on the
 * counter being reliable and consistent across CPUs.
 *
 * Note that this must be true UTC, never with smeared leap seconds. If a
 * guest wishes to construct a smeared clock, it can do so. Presenting a
 * smeared clock through this interface would be problematic because it
 * actually messes with the apparent counter *period*. A linear smearing
 * of 1 ms per second would effectively tweak the counter period by 1000PPM
 * at the start/end of the smearing period, while a sinusoidal smear would
 * basically be impossible to represent.
 *
 * This structure is offered with the intent that it be adopted into the
 * nascent virtio-rtc standard, as a virtio-rtc that does not address the l=
ive
 * migration problem seems a little less than fit for purpose. For that
 * reason, certain fields use precisely the same numeric definitions as in
 * the virtio-rtc proposal. The structure can also be exposed through an AC=
PI
 * device with the CID "VMCLOCK", modelled on the "VMGENID" device except f=
or
 * the fact that it uses a real _CRS to convey the address of the structure
 * (which should be a full page, to allow for mapping directly to userspace=
).
 */

#ifndef __VMCLOCK_ABI_H__
#define __VMCLOCK_ABI_H__

#ifdef __KERNEL__
#include <linux/types.h>
#else
#include <stdint.h>
#endif

struct vmclock_abi {
	uint64_t magic;
#define VMCLOCK_MAGIC	0x4b4c4356 /* "VCLK" */
	uint16_t size;		/* Size of page containing this structure */
	uint16_t version;	/* 1 */

	/* Sequence lock. Low bit means an update is in progress. */
	uint32_t seq_count;



	uint32_t flags;
	/* Indicates that the tai_offset_sec field is valid */
#define VMCLOCK_FLAG_TAI_OFFSET_VALID		(1 << 0)
	/*
	 * Optionally used to notify guests of pending maintenance events.
	 * A guest may wish to remove itself from service if an event is
	 * coming up. Two flags indicate the rough imminence of the event.
	 */
#define VMCLOCK_FLAG_DISRUPTION_SOON		(1 << 1) /* About a day */
#define VMCLOCK_FLAG_DISRUPTION_IMMINENT	(1 << 2) /* About an hour */
	/* Indicates that the utc_time_maxerror_picosec field is valid */
#define VMCLOCK_FLAG_UTC_MAXERROR_VALID		(1 << 3)
	/* Indicates counter_period_error_rate_frac_sec is valid */
#define VMCLOCK_FLAG_PERIOD_ERROR_VALID		(1 << 4)

	/*
	 * This field changes to another non-repeating value when the CPU
	 * counter is disrupted, for example on live migration. This lets
	 * the guest know that it should discard any calibration it has
	 * performed of the counter against external sources (NTP/PTP/etc.).
	 */
	uint64_t disruption_marker;

	uint8_t clock_status;
#define VMCLOCK_STATUS_UNKNOWN		0
#define VMCLOCK_STATUS_INITIALIZING	1
#define VMCLOCK_STATUS_SYNCHRONIZED	2
#define VMCLOCK_STATUS_FREERUNNING	3
#define VMCLOCK_STATUS_UNRELIABLE	4

	uint8_t counter_id; /* Matches VIRTIO_RTC_COUNTER_xxx */
#define VMCLOCK_COUNTER_ARM_VCNT	0
#define VMCLOCK_COUNTER_X86_TSC		1
#define VMCLOCK_COUNTER_INVALID		0xff

	/*
	 * By providing the offset from UTC to TAI, the guest can know both
	 * UTC and TAI reliably, whichever is indicated in the time_type
	 * field. Valid if VMCLOCK_FLAG_TAI_OFFSET_VALID is set in flags.
	 */
	int16_t tai_offset_sec;

	/*
	 * What time is exposed in the time_sec/time_frac_sec fields?
	 */
	uint8_t time_type; /* Matches VIRTIO_RTC_TYPE_xxx */
#define VMCLOCK_TIME_UTC			0	/* Since 1970-01-01 00:00:00z */
#define VMCLOCK_TIME_TAI			1	/* Since 1970-01-01 00:00:00z */
#define VMCLOCK_TIME_MONOTONIC			2	/* Since undefined epoch */
#define VMCLOCK_TIME_INVALID_SMEARED		3	/* Not supported */
#define VMCLOCK_TIME_INVALID_MAYBE_SMEARED	4	/* Not supported */

	/*
	 * The time exposed through this device is never smeared. This field
	 * corresponds to the 'subtype' field in virtio-rtc, which indicates
	 * the smearing method. However in this case it provides a *hint* to
	 * the guest operating system, such that *if* the guest OS wants to
	 * provide its users with an alternative clock which does not follow
	 * the POSIX CLOCK_REALTIME standard, it may do so in a fashion
	 * consistent with the other systems in the nearby environment.
	 */
	uint8_t leap_second_smearing_hint; /* Matches VIRTIO_RTC_SUBTYPE_xxx */
#define VMCLOCK_SMEARING_STRICT		0
#define VMCLOCK_SMEARING_NOON_LINEAR	1
#define VMCLOCK_SMEARING_UTC_SLS	2

	/* Bit shift for counter_period_frac_sec and its error rate */
	uint8_t counter_period_shift;

	/*
	 * Unlike in NTP, this can indicate a leap second in the past. This
	 * is needed to allow guests to derive an imprecise clock with
	 * smeared leap seconds for themselves, as some modes of smearing
	 * need the adjustments to continue even after the moment at which
	 * the leap second should have occurred.
	 */
	uint8_t leap_indicator; /* Matches VIRTIO_RTC_LEAP_xxx */
#define VMCLOCK_LEAP_NONE	0
#define VMCLOCK_LEAP_PRE_POS	1
#define VMCLOCK_LEAP_PRE_NEG	2
#define VMCLOCK_LEAP_POS	3
#define VMCLOCK_LEAP_NEG	4

	uint64_t leapsecond_tai_sec; /* Since 1970-01-01 00:00:00z */

	/*
	 * Paired values of counter and UTC at a given point in time.
	 */
	uint64_t counter_value;
	uint64_t time_sec;
	uint64_t time_frac_sec;

	/*
	 * Counter frequency, and error margin. The unit of these fields is
	 * seconds >> (64 + counter_period_shift)
	 */
	uint64_t counter_period_frac_sec;
	uint64_t counter_period_error_rate_frac_sec;

	/* Error margin of UTC reading above (=C2=B1 picoseconds) */
	uint64_t utc_time_maxerror_picosec;
};

#endif /*  __VMCLOCK_ABI_H__ */




--=-hmmOuEDQGPI61e8TF6l2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzAzMTA0MDE2WjAvBgkqhkiG9w0BCQQxIgQgZCe40p6F
Jgn36ip6I7DbUCNmxUxGAC+l5pv8I4EE8V8wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCHbtEsKN0XCsye7v/O3ytAZs9GNnidXNoI
TRRlRab3i91KR9xK/U8Pa4un33GyMEXIAHuXfq7Z6WU4EHuAd1zPsNGRJA3UFszafdsQiUyTvXHK
6vyR0Fnp0OC8jTHqAbIX6lziyExC8APKJ9o+gf/pfK5E+bYf5o120Ryr9lIqprAkFfwXY9tGxEAf
poIQDIzB+QDv+zkTMcFYsWHQk/2w1BnJlDX32en6Vxwm+Fkhv1nz5c+VxIrfZL5zH25tnOtTWhVH
+62FyPyXcphxzwS6BRdx10L4PmpmVoqWWfM7Sv3HK3+VqZ3MoHDImfrDGHtXCFf3rIuwHuoFcAoi
T8U/wvd5WrxabLbRlqCuGlwSRk4yyXt4BgNixn7m29IDU8e5rKL6SJ9qvZDPna6NWN7BB6sUJWD7
Ri9unXyLHWVaEk0j5SZ2mZH0fzl9PJTUHB8bktTk6ERqsdqZgvqNDvpEayh04TrqRDxrHT1OpumC
8IrSlV8etCCeig89RQpg77JSrFHrumNrrU6TH/aNln3w8TZcqZ/7gdM95KxRTSfmetaScdssg+7Y
VWe1GM5dKefuyimUT8EHQ1/tfBsoOsedNSySSJJ2KF5/z6Q0PqjCBeYvBsC3Q7W0IFvWWswo2Uro
qz4onw5ksN8Q4Oxvv+u1GHDOQMJeiG6wXR8XfFoWSgAAAAAAAA==


--=-hmmOuEDQGPI61e8TF6l2--

