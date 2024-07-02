Return-Path: <linux-rtc+bounces-1438-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF589243B8
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 18:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C7641C248BD
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 16:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243A41BD4FD;
	Tue,  2 Jul 2024 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pVNsa730"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA891BD4E8;
	Tue,  2 Jul 2024 16:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938370; cv=none; b=MBK7OFMz2fk+GS3j3rigd1fp8Dtgy3KeRo05w6cI18dnJHqUQiAvsEnm1kVRa0+FC5lIiyrCbUtpNS62IPen7vBlvtViSKga9+QxKRfMPCLeuqous9/x5/x1VbewtINEy6lzlqdpIS6aYfe1sftftU/29Rekd23P2ln9zVHRHiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938370; c=relaxed/simple;
	bh=1pp+2RtaVqxGA6848wusp+OD6LAM8rAPY6Y/pvbSXUI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rKJxOou4cuIT5PO9nM9pkT4Z/x8F3UOug0Cv4EoZbCahURzuJ/5YXUjiWVduw6O3YEbxqILtfJlJX70tnPvDxvjYiIhp01Ei9K/cdq0Q8qfUxsIHf/oHRh0KgKE6SREBqcrU97RXgsRUMUq16IZ8n+gsrUkc4deifcv8GcDsMMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pVNsa730; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xzIkmN/JXvrZu3tA26G8jCkd7Lbt7qkoINqH6nZaNUE=; b=pVNsa730uqINMlpoE4ThHvf9p0
	//OL8lzdA5dPrdWR6V8Yyuh4fqo3coEIjWUImLMolqqqTgls4Alkcxdr4dT8401FBEqMRFK69nnvo
	kVmlTJaQuBDGFpU2yLR/Snc/8tkN8kRCcAumqcmc/iITcWAfmjUSYNDmJ3kMokjsU/LliPOj9p2z0
	IurOGIEoUS0Vu6NuvhS0Bz0El/dlwKvXPg5s91tEvd3ugH3rcyxMdwulSnCz4sWWiFVi+a+1tut77
	Arc9SxXtSkfM50v8NJ0OHqEYSgrGkWxrioHnjA/WYVh9Li43HDpN5p0nGCSFNeoQnYXSNjBrxshIS
	d6o9v3hg==;
Received: from [2001:8b0:10b:5:d370:2beb:3e8d:77b] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOgXH-00000000x9V-2LJY;
	Tue, 02 Jul 2024 16:39:19 +0000
Message-ID: <3707d99d0dfea45d05fd65f669132c2e546f35c6.camel@infradead.org>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 linux-kernel@vger.kernel.org,  virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-rtc@vger.kernel.org, "Ridoux,
 Julien" <ridouxj@amazon.com>,  virtio-dev@lists.linux.dev, "Luu, Ryan"
 <rluu@amazon.com>
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>, Jason Wang
 <jasowang@redhat.com>, John Stultz <jstultz@google.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 02 Jul 2024 17:39:16 +0100
In-Reply-To: <cb11ff57-4d58-4d47-824b-761712e12bdc@opensynergy.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
	 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
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
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-e1EFw9hCYvErqrQp75fd"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-e1EFw9hCYvErqrQp75fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-07-02 at 17:03 +0200, Peter Hilber wrote:
> > On 01.07.24 10:57, David Woodhouse wrote:
> > > > If my proposed memory structure is subsumed into the virtio-rtc
> > > > proposal we'd literally use the same names, but for the time being =
I'll
> > > > update mine to:
> >=20
> > Do you intend vmclock and virtio-rtc to be ABI compatible?

I intend you to incorporate a shared memory structure like the vmclock
one into the virtio-rtc standard :)

Because precision clocks in a VM are fundamentally nonsensical without
a way for the guest to know when live migration has screwed them up.

So yes, so facilitate that, I'm trying to align things so that the
numeric values of fields like the time_type and smearing hint are
*precisely* the same as the VIRTIO_RTC_xxx values.

Time pressure *may* mean I have to ship an ACPI-based device with a
preliminary version of the structure before I've finished persuading
you, and before we've completely finalized the structure. I am hoping
to avoid that.

(In fact, my time pressure only applies to a version of the structure
which carries the disruption_marker field; the actual clock calibration
information doesn't have to be present in the interim implementation.)


> >  FYI, I see a
> > potential problem in that Virtio does avoid the use of signed integers =
so
> > far. I did not check carefully if there might be other problems, yet.

Hm, you use an unsigned integer to convey the tai_offset. I suppose at
+37 and with a plan to stop doing leap seconds in the next decade,
we're unlikely to get back below zero?

The other signed integer I had was for the leap second direction, but I
think I'm happy to drop that and just adopt your uint8_t leap field
with VIRTIO_RTC_LEAP_{PRE_POS,PRE_NEG,etc.}.





> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * What time is exp=
osed in the time_sec/time_frac_sec fields?
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t time_type;
> > > > #define VMCLOCK_TIME_UTC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* Since 1970-01-01 00:00:00z */
> > > > #define VMCLOCK_TIME_TAI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* Since 1970-01-01 00:00:00z */
> > > > #define VMCLOCK_TIME_MONOTONIC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A02=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Since=
 undefined epoch */
> > > > #define VMCLOCK_TIME_INVALID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0/* virtio-rtc uses this for smeared UTC */
> > > >=20
> > > >=20
> > > > I can then use your smearing subtype values as the 'hint' field in =
the
> > > > shared memory structure. You currently have:
> > > >=20
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_RTC_SUBTYPE_STRICT 0
> > > > +#define VIRTIO_RTC_SUBTYPE_SMEAR 1
> > > > +#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 2
> > > > +#define VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED 3
> > > > +\end{lstlisting}
> > > >=20
> >=20
> > I agree with the above part of your proposal.
> >=20
> > > > I can certainly ensure that 'noon linear' has the same value. I don=
't
> > > > think you need both 'SMEAR' and 'LEAP_UNSPECIFIED' though:
> > > >=20
> > > >=20
> > > > +\item VIRTIO_RTC_SUBTYPE_SMEAR deviates from the UTC standard by
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0smearing time in the vic=
inity of the leap second, in a not
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0precisely defined manner=
. This avoids clock steps due to UTC
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0leap seconds.
> > > >=20
> > > > ...
> > > >=20
> > > > +\item VIRTIO_RTC_SUBTYPE_LEAP_UNSPECIFIED may deviate from the UTC
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0standard w.r.t.\ leap se=
cond introduction in an unspecified
> > > > way
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(leap seconds may, or ma=
y not, be smeared).
> > > >=20
> > > > To the client, both of those just mean "for a day or so around a le=
ap
> > > > second event, you can't trust this device to know what the time is"=
.
> > > > There isn't any point in separating "does lie to you" from "might l=
ie
> > > > to you", surely? The guest can't do anything useful with that
> > > > distinction. Let's drop SMEAR and keep only LEAP_UNSPECIFIED?
> >=20
> > As for VIRTIO_RTC_SUBTYPE_SMEAR, I think this could be dropped indeed
> > (resp., UTC_SLS may be added).
> >=20
> > But VIRTIO_RTC_CLOCK_SMEARED_UTC is an assurance that there will be no
> > steps (in particular, steps backwards, which some clients might not lik=
e)
> > due to leap seconds, while LEAP_UNSPECIFIED provides no such guarantee.
> >=20
> > So I think this might be better handled by adding, alongside
> >=20
> > > > #define VIRTIO_RTC_CLOCK_SMEARED_UTC 3
> >=20
> > #define VIRTIO_RTC_CLOCK_LEAP_UNSPECIFIED_UTC 4
> >=20
> > (or any better name, like VIRTIO_RTC_CLOCK_MAYBE_SMEARED_UTC).
> >=20
> > > >=20
> > > > And if you *really* want to parameterise it, I think that's a bad i=
dea
> > > > and it encourages the proliferation of different time "standards", =
but
> > > > I'd probably just suck it up and do whatever you do because that's =
not
> > > > strictly within the remit of my live-migration part.
> >=20
> > I think the above proposal to have subtypes for
> > VIRTIO_RTC_CLOCK_SMEARED_UTC should work.

To clarify then, the main types are

 VIRTIO_RTC_CLOCK_UTC =3D=3D 0
 VIRTIO_RTC_CLOCK_TAI =3D=3D 1
 VIRTIO_RTC_CLOCK_MONOTONIC =3D=3D 2
 VIRTIO_RTC_CLOCK_SMEARED_UTC =3D=3D 3

And the subtypes are *only* for the case of
VIRTIO_RTC_CLOCK_SMEARED_UTC. They include

 VIRTIO_RTC_SUBTYPE_STRICT
 VIRTIO_RTC_SUBTYPE_UNDEFINED /* or whatever you want to call it */
 VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR=20
 VIRTIO_RTC_SUBTYPE_UTC_SLS /* if it's worth doing this one */

Is that what we just agreed on?



--=-e1EFw9hCYvErqrQp75fd
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzAyMTYzOTE2WjAvBgkqhkiG9w0BCQQxIgQgS25hY12v
+S3JG/PhE1geVF0BSVftnnAeMd3KeB4k/aIwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBlEPmGdBi+HY+WYEUHVvsdJ8hcMUVQVHwX
FCrHpkh/zzb+pNEBf/WRfW9GlkdUG0HrGGQkp9paQzeQSqXLSEj7Pqyfw/VxDRlETMr0CgdPPKK5
S4XWs3hymFRkjxRuMhA25XeqLAYA0OLmojLhPNxwTDBzzq4/OQNKbP049km8+fzG78g+sYxUho9F
6wNO4lVEF8F+ebXSCq++Cks6tmwIicqv0GaoBgpu5u3ZhpP8gO5lJHOitHflf6Y+ot2llShJ+WCb
d1CCT8uLUhACPI5XHNqJVZ4MnB8M5bQfy9/yuVEOtKPS+TmzCp5LJ3ALZBHEW7u45xpgHO2SnZ8a
Og8oWgCbaejpUFHzguULk7Zs+jIBVogFX3sPZx4l/EKuDcQhvhZPxG1X9t3HQZxZoLiCvqNqiISh
1YmbS5iWeMao68RKZcT/dYokxcd1EHFUAer03hq5fUifv+GziqoNU0gg9+/ziDBIlxkbOX1/318y
EaBklGrPedGw+iVj0netpWR7uEhBnGm0vjUSGeRzq3JNGKnVKca0CMZjv7oLu1Ugnp/aAEPhAIGg
X/tEeWtYJ/c49rKrn+5Q8mr1QVLnr3lqC36x/Q1fWbk9G4UOVVGS8SJENfcj/Lb7m9buF4xDqfe/
SOaAr8tBFE7n8POdMJkKuHqLDsCMRYGzywAst4T00QAAAAAAAA==


--=-e1EFw9hCYvErqrQp75fd--

